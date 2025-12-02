import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/category/category_model.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/presentation/providers/dashboard/dashboard_state.dart';
import 'package:plux/src/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

@riverpod
class Dashboard extends _$Dashboard {
  @override
  FutureOr<DashboardState> build() async {
    return await _loadDashboard();
  }

  Future<DashboardState> _loadDashboard() async {
    final categoryPro = ref.read(getAllCategoryUseCaseProvider);
    final productPro = ref.read(getAllProductsUseCaseProvider);

    final result = await Future.wait([
      categoryPro.getCategories(),
      productPro.invoke(),
    ]);

    if (result[0] is Failure) {
      throw result[0].error!;
    }

    final categoryResult = result[0] as DataState<List<CategoryModel>>;
    final productResult = result[1] as DataState<List<ProductModel>>;

    return DashboardState(
      categories: categoryResult.data!,
      products: productResult.data!,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadDashboard());
  }
}
