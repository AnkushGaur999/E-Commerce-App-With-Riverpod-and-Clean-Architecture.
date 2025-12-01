import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:plux/src/core/services/token_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  bool _isRefreshing = false;

  AuthInterceptor({required this.dio});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await TokenService.getAccessToken();
    if (accessToken != null) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // 2. Check for 401 Unauthorized error and if a response exists
    if (err.response?.statusCode == 401 && err.response != null) {
      final requestOptions = err.requestOptions;

      if (!_isRefreshing) {
        // Only one request should attempt to refresh the token
        _isRefreshing = true;
        try {
          final newAccessToken = await _attemptTokenRefresh();

          if (newAccessToken != null) {
            // 4. Update the header with the new token for the original request
            requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

            // 5. Retry the original request
            final response = await dio.fetch(requestOptions);
            // Resolve the interceptor chain with the successful response
            return handler.resolve(response);
          }
        } catch (e) {
          // Refresh failed (e.g., refresh token expired), force logout
          await TokenService.clearTokens();
          // AppRoutes.router.go(AppRoutes.login);
          return handler.reject(err);
        } finally {
          _isRefreshing = false;
        }
      }
      // If a refresh is already happening, just wait for it (handled by QueuedInterceptor)
    }

    super.onError(err, handler);
  }

  Future<String?> _attemptTokenRefresh() async {
    final refreshToken = await TokenService.getRefreshToken();
    if (refreshToken == null) return null;

    // 3. Call the refresh token API
    try {
      final response = await dio.post(
        'auth/refresh',
        // Example refresh token endpoint
        data: {'refreshToken': refreshToken},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['accessToken'] as String;
        final newRefreshToken =
            response.data['refreshToken']
                as String; // Often a new refresh token is also returned

        // Save the newly received tokens
        await TokenService.saveTokens(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        );

        return newAccessToken;
      }

      // If the API returns a non-200 (e.g., 401/403 for an expired refresh token)
    } on DioException catch (_) {
      // Handle network errors or specific API error responses (e.g., 401)
      await TokenService.clearTokens(); // Force logout if refresh fails
    }
    return null;
  }
}
