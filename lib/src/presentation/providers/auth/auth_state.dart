import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plux/src/data/models/auth/login_response.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {

  const factory AuthState.initial() = _AuthInitial;

  const factory AuthState.loading() = _AuthLoading;

  const factory AuthState.loginSuccess({required LoginResponse data}) = _AuthLoginSucess;

  const factory AuthState.loginError({required String message}) = _AuthLoginError;

}

