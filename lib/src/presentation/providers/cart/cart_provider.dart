import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/cart/cart_response.dart';
import 'package:plux/src/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  FutureOr<CartResponse> build() async {
    final response = await _getCartItems();

    if (response is Success) {
      return response.data!;
    } else {
      throw response.error!;
    }
  }

  Future<void> fetchCartItems() async {
    state = AsyncLoading();

    final response = await _getCartItems();

    if (response is Success) {
      state = AsyncData(response.data!);
    } else {
      state = AsyncError(response.error!, StackTrace.current);
    }
  }

  Future<DataState<CartResponse>> _getCartItems() async {
    return await ref.read(cartRepositoryProvider).getCartItems();
  }
}
