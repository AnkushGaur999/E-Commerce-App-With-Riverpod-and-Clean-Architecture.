import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/cart/cart_response.dart';

abstract class CartRepository {

  Future<DataState<CartResponse>> getCartItems();

}