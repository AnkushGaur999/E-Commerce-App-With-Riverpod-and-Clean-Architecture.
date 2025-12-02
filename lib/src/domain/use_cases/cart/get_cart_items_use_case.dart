import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/cart/cart_response.dart';
import 'package:plux/src/domain/repositories/cart/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository cartRepository;

  GetCartItemsUseCase({required this.cartRepository});

  Future<DataState<CartResponse>> getCartItems() async =>
      cartRepository.getCartItems();
}
