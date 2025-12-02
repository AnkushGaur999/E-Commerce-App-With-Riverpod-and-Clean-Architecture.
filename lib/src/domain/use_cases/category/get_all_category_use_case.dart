import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/category/category_model.dart';
import 'package:plux/src/domain/repositories/category/category_repository.dart';

class GetAllCategoryUseCase {
  final CategoryRepository repository;

  GetAllCategoryUseCase({required this.repository});

  Future<DataState<List<CategoryModel>>> getCategories() async {
    return await repository.getCategories();
  }
}
