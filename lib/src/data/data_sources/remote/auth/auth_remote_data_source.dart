import 'package:plux/src/core/errors/network_exception.dart';
import 'package:plux/src/core/network/client/network_client.dart';
import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/auth/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<DataState<LoginResponse>> login({
    required String userName,
    required String password,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final NetworkClient client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<DataState<LoginResponse>> login({
    required String userName,
    required String password,
  }) async {
    try {
      final response = await client.post(
        endPoint: "auth/login",
        data: {"username": userName, "password": password},
      );

      return Success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      return Failure(error: NetworkException.fromException(e).message);
    }
  }
}
