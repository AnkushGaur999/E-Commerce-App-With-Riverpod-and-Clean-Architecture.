import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:plux/src/data/models/cart/cart_response.dart';
import 'package:plux/src/domain/repositories/cart/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource dataSource;

  CartRepositoryImpl({required this.dataSource});

  @override
  Future<DataState<CartResponse>> getCartItems() async =>
      await dataSource.getCartItems();
}
