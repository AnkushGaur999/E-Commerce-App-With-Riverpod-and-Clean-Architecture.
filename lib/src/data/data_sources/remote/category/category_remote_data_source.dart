import 'package:plux/src/core/errors/network_exception.dart';
import 'package:plux/src/core/network/client/network_client.dart';
import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/category/category_model.dart';

class CategoryRemoteDataSource {
  final NetworkClient client;

  CategoryRemoteDataSource({required this.client});

  Future<DataState<List<CategoryModel>>> getCategories() async {
    try {
      final response = await client.get(endPoint: "products/categories");

      List<dynamic> items = response.data;

      List<CategoryModel> categories = items
          .map((item) => CategoryModel.fromJson(item))
          .toList();

      return Success(data: categories);
    } catch (e) {
      return Failure(error: NetworkException.fromException(e).message);
    }
  }
}
