import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/data_sources/remote/product/product_remote_data_source.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/domain/repositories/product/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource dataSource;

  ProductRepositoryImpl({required this.dataSource});

  @override
  Future<DataState<List<ProductModel>>> getAllProducts() async {
    return await dataSource.getAllProducts();
  }

  @override
  Future<DataState<ProductModel>> getProductDetails(String id) async =>
      await dataSource.getProductDetails(id);

  @override
  Future<DataState<List<ProductModel>>> searchProducts(String query) async =>
      await dataSource.searchProducts(query);
}
