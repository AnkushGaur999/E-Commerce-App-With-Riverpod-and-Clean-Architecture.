import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/auth/login_response.dart';
import 'package:plux/src/domain/repositories/auth/auth_repository.dart';

class UserLoginUseCase {
  final AuthRepository repository;

  UserLoginUseCase({required this.repository});

  Future<DataState<LoginResponse>> invoke({
    required String userName,
    required String password,
  }) => repository.login(userName: userName, password: password);
}
