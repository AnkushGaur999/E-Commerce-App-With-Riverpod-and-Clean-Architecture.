import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/product/product_model.dart';

abstract class ProductRepository {

  Future<DataState<List<ProductModel>>> getAllProducts();

  Future<DataState<ProductModel>> getProductDetails(String id);

  Future<DataState<List<ProductModel>>> searchProducts(String query);

}