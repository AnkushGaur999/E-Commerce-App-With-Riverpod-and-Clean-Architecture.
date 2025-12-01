import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:plux/src/data/models/auth/login_response.dart';
import 'package:plux/src/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<DataState<LoginResponse>> login({
    required String userName,
    required String password,
  }) async => dataSource.login(userName: userName, password: password);
}
