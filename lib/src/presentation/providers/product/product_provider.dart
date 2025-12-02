import 'package:plux/src/core/utils/data_state.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'product_state.dart';

part 'product_provider.g.dart';

@riverpod
class AllProduct extends _$AllProduct {
  @override
  FutureOr<AllProductState> build() async {
    final result = await _fetchAllProducts();

    if (result is Success<List<ProductModel>> && result.data != null) {
      return AllProductState(allProducts: result.data!);
    } else {
      throw result.error ?? "Failed to load products";
    }
  }

  Future<void> getAllProducts() async {
    state = await AsyncValue.guard(() async {
      final result = await _fetchAllProducts();

      if (result is Success<List<ProductModel>> && result.data != null) {
        return AllProductState(allProducts: result.data!);
      } else {
        throw result.error ?? "Failed to refresh products";
      }
    });
  }

  Future<DataState<List<ProductModel>>> _fetchAllProducts() async {
    state = const AsyncLoading();
    final getAllProductsUseCase = ref.read(getAllProductsUseCaseProvider);
    return await getAllProductsUseCase.invoke();
  }
}

@riverpod
class SearchProduct extends _$SearchProduct {
  @override
  Future<SearchProductState?> build() async {
    return SearchProductState.initial();
  }

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      state = AsyncData(SearchProductState(products: const []));
      return;
    }
    final response = await _fetchSearchProducts(query);
    if (response is Success) {
      state = AsyncData(SearchProductState(products: response.data!));
    } else {
      state = AsyncError(
        response.error ?? "Something went wrong",
        StackTrace.current,
      );
    }
  }

  Future<DataState<List<ProductModel>>> _fetchSearchProducts(
    String query,
  ) async {
    state = AsyncLoading();
    final searchProductUseCase = ref.read(searchProductUseCaseProvider);

    return await searchProductUseCase.searchProducts(query);
  }
}
