
import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/domain/repositories/product/product_repository.dart';

class SearchProductUseCase {
  final ProductRepository repository;

  const SearchProductUseCase({required this.repository});

  Future<DataState<List<ProductModel>>> searchProducts(String query)async => repository.searchProducts(query);

}