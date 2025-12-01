import 'package:plux/src/core/services/token_service.dart';
import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/presentation/providers/auth/auth_state.dart';
import 'package:plux/src/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    return AuthState.initial();
  }

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    state = AuthState.loading();

    final response = await ref
        .read(userLoginUseCaseProvider)
        .invoke(userName: userName, password: password);

    if (response is Success) {
      TokenService.saveTokens(
        accessToken: response.data!.accessToken!,
        refreshToken: response.data!.refreshToken!,
      );
      state = AuthState.loginSuccess(data: response.data!);
    } else {
      state = AuthState.loginError(message: response.error!);
    }
  }
}
