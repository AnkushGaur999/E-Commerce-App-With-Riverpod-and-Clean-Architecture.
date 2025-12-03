import 'package:plux/src/core/network/client/network_client.dart';
import 'package:plux/src/core/storage/local_storage.dart';
import 'package:plux/src/data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:plux/src/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:plux/src/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:plux/src/data/data_sources/remote/product/product_remote_data_source.dart';
import 'package:plux/src/data/repositories_impl/auth/auth_repository_impl.dart';
import 'package:plux/src/data/repositories_impl/cart/cart_repository_impl.dart';
import 'package:plux/src/data/repositories_impl/category/category_repository_impl.dart';
import 'package:plux/src/data/repositories_impl/product/product_repository_impl.dart';
import 'package:plux/src/domain/repositories/auth/auth_repository.dart';
import 'package:plux/src/domain/repositories/cart/cart_repository.dart';
import 'package:plux/src/domain/repositories/category/category_repository.dart';
import 'package:plux/src/domain/repositories/product/product_repository.dart';
import 'package:plux/src/domain/use_cases/auth/user_login_use_case.dart';
import 'package:plux/src/domain/use_cases/cart/get_cart_items_use_case.dart';
import 'package:plux/src/domain/use_cases/category/get_all_category_use_case.dart';
import 'package:plux/src/domain/use_cases/products/get_all_products_use_case.dart';
import 'package:plux/src/domain/use_cases/products/get_product_details_use_case.dart';
import 'package:plux/src/domain/use_cases/products/search_product_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
LocalStorage localStorage(Ref ref) {
  return LocalStorage();
}

@riverpod
NetworkClient networkClient(Ref ref) {
  return NetworkClient();
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSourceImpl(client: ref.read(networkClientProvider));
}

@riverpod
ProductRemoteDataSource productRemoteDataSource(Ref ref) {
  return ProductRemoteDataSourceImpl(client: ref.read(networkClientProvider));
}

@riverpod
CategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  return CategoryRemoteDataSource(client: ref.read(networkClientProvider));
}

@riverpod
CartRemoteDataSource cartRemoteDataSource(Ref ref) {
  return CartRemoteDataSource(
    client: ref.read(networkClientProvider),
    localStorage: ref.read(localStorageProvider),
  );
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(dataSource: ref.read(authRemoteDataSourceProvider));
}

@riverpod
CartRepository cartRepository(Ref ref) {
  return CartRepositoryImpl(dataSource: ref.read(cartRemoteDataSourceProvider));
}

@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl(
    dataSource: ref.read(productRemoteDataSourceProvider),
  );
}

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepositoryImpl(
    dataSource: ref.read(categoryRemoteDataSourceProvider),
  );
}

@riverpod
UserLoginUseCase userLoginUseCase(Ref ref) {
  return UserLoginUseCase(repository: ref.read(authRepositoryProvider));
}

@riverpod
GetAllCategoryUseCase getAllCategoryUseCase(Ref ref) {
  return GetAllCategoryUseCase(
    repository: ref.read(categoryRepositoryProvider),
  );
}

@riverpod
GetAllProductsUseCase getAllProductsUseCase(Ref ref) {
  return GetAllProductsUseCase(repository: ref.read(productRepositoryProvider));
}

@riverpod
GetCartItemsUseCase getCartItemsUseCase(Ref ref) {
  return GetCartItemsUseCase(cartRepository: ref.read(cartRepositoryProvider));
}

@riverpod
GetProductDetailsUseCase getProductDetailsUseCase(Ref ref) {
  return GetProductDetailsUseCase(
    repository: ref.read(productRepositoryProvider),
  );
}

@riverpod
SearchProductUseCase searchProductUseCase(Ref ref) {
  return SearchProductUseCase(repository: ref.read(productRepositoryProvider));
}
