import 'package:plux/src/core/errors/network_exception.dart';
import 'package:plux/src/core/network/client/network_client.dart';
import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/cart/cart_response.dart';

class CartRemoteDataSource {
  final NetworkClient client;

  CartRemoteDataSource({required this.client});

  Future<DataState<CartResponse>> getCartItems() async {
    String id = "1";

    try {
      final response = await client.get(endPoint: "carts/$id");
      return Success(data: CartResponse.fromJson(response.data));
    } catch (e) {
      return Failure(error: NetworkException.fromException(e).message);
    }
  }
}
