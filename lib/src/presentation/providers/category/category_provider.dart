import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/category/category_model.dart';
import 'package:plux/src/presentation/providers/category/category_state.dart';
import 'package:plux/src/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
class Category extends _$Category {
  @override
  FutureOr<CategoryState> build() async {
    final response = await _getCategories();

    if (response is Success) {
      return CategoryState(categories: response.data!);
    } else {
      throw response.error!;
    }
  }

  Future<void> fetchCategories() async {
    state = AsyncLoading();

    final response = await _getCategories();

    if (response is Success) {
      state = AsyncData(CategoryState(categories: response.data!));
    } else {
      state = AsyncError(
        response.error ?? "Something went wrong",
        StackTrace.current,
      );
    }
  }

  Future<DataState<List<CategoryModel>>> _getCategories() async {
    return await ref.read(getAllCategoryUseCaseProvider).getCategories();
  }
}
