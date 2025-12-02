
import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/category/category_model.dart';

abstract class CategoryRepository {

  Future<DataState<List<CategoryModel>>> getCategories();

}