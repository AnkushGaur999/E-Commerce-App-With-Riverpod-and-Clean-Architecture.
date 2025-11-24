import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/domain/repositories/product/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase({required this.repository});

  Future<DataState<List<ProductModel>>> invoke() async =>
      await repository.getAllProducts();
}
