import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/domain/repositories/product/product_repository.dart';

class GetProductDetailsUseCase {
  final ProductRepository repository;

  GetProductDetailsUseCase({required this.repository});

  Future<DataState<ProductModel>> getProductDetails(String id) async =>
      await repository.getProductDetails(id);
}
