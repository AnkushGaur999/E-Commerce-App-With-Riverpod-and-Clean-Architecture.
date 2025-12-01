import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/auth/login_response.dart';

abstract class AuthRepository {

  Future<DataState<LoginResponse>> login(
      {required String userName, required String password});

}