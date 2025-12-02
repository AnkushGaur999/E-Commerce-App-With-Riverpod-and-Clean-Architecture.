import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:plux/src/data/models/category/category_model.dart';
import 'package:plux/src/domain/repositories/category/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource dataSource;

  CategoryRepositoryImpl({required this.dataSource});

  @override
  Future<DataState<List<CategoryModel>>> getCategories() async =>
      await dataSource.getCategories();
}
