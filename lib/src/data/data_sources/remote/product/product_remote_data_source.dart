import 'package:plux/src/core/errors/network_exception.dart';
import 'package:plux/src/core/network/client/network_client.dart';
import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/product/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<DataState<List<ProductModel>>> getAllProducts();

  Future<DataState<ProductModel>> getProductDetails(String id);

  Future<DataState<List<ProductModel>>> searchProducts(String query);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final NetworkClient client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<DataState<List<ProductModel>>> getAllProducts() async {
    try {
      final response = await client.get(endPoint: "products");

      List<ProductModel> products = (response.data["products"] as List<dynamic>)
          .map((data) => ProductModel.fromJson(data))
          .toList();

      return Success(data: products);
    } catch (e) {
      return Failure(error: NetworkException.fromException(e).message);
    }
  }

  @override
  Future<DataState<ProductModel>> getProductDetails(String id) async {
    try {
      final response = await client.get(endPoint: "products/$id");

      final product = ProductModel.fromJson(response.data);

      return Success(data: product);
    } catch (e) {
      return Failure(error: NetworkException.fromException(e).message);
    }
  }

  @override
  Future<DataState<List<ProductModel>>> searchProducts(String query) async {
    try {
      final response = await client.get(
        endPoint: "products/search",
        queryParameters: {"q": query},
      );

      List<ProductModel> products = (response.data["products"] as List<dynamic>)
          .map((data) => ProductModel.fromJson(data))
          .toList();

      return Success(data: products);
    } catch (e) {
      return Failure(error: NetworkException.fromException(e).message);
    }
  }
}
