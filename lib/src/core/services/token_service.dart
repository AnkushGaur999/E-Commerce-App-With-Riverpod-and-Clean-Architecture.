import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  // Constants for storage keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  // Secure storage instance
  static final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static final TokenService _instance = TokenService._private();

  TokenService._private();

  factory TokenService() => _instance;

  // --- GETTERS ---

  static Future<String?> getAccessToken() {
    return _storage.read(key: _accessTokenKey);
  }

  static Future<String?> getRefreshToken() {
    return _storage.read(key: _refreshTokenKey);
  }

  // --- STORAGE HANDLERS ---

  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  static Future<void> clearTokens() async {
    // Clear both tokens upon logout
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    // You might also notify the UI to navigate to the Login screen here
  }

  static Future<bool?> isUsedLoggedIn() async {
    return await _storage.containsKey(key: _accessTokenKey) ||
        await _storage.containsKey(key: _refreshTokenKey);
  }
}
