import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

part 'login_response.freezed.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    String? accessToken,
    String? refreshToken,
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
