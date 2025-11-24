import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:plux/src/core/network/interceptors/auth_interceptor.dart';

class NetworkClient {
  static final NetworkClient _client = NetworkClient._private();
  late Dio _dio;

  NetworkClient._private() {
    _dio = Dio()
      ..options.baseUrl = dotenv.get("BASE_URL")
      ..options.connectTimeout = Duration(seconds: 30)
      ..options.receiveTimeout = Duration(seconds: 30)
      ..options.sendTimeout = Duration(seconds: 30)
      ..interceptors.add(AuthInterceptor());
  }

  factory NetworkClient() {
    return _client;
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.post(endPoint, data: data);
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
