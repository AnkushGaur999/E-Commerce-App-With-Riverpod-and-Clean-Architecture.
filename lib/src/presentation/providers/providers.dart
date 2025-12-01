import 'package:plux/src/core/network/client/network_client.dart';
import 'package:plux/src/data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:plux/src/data/data_sources/remote/product/product_remote_data_source.dart';
import 'package:plux/src/data/repositories_impl/auth/auth_repository_impl.dart';
import 'package:plux/src/data/repositories_impl/product/product_repository_impl.dart';
import 'package:plux/src/domain/repositories/auth/auth_repository.dart';
import 'package:plux/src/domain/repositories/product/product_repository.dart';
import 'package:plux/src/domain/use_cases/auth/user_login_use_case.dart';
import 'package:plux/src/domain/use_cases/products/get_all_products_use_case.dart';
import 'package:plux/src/domain/use_cases/products/get_product_details_use_case.dart';
import 'package:plux/src/domain/use_cases/products/search_product_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
NetworkClient networkClient(Ref ref) {
  return NetworkClient();
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSourceImpl(client: ref.watch(networkClientProvider));
}

@riverpod
ProductRemoteDataSource productRemoteDataSource(Ref ref) {
  return ProductRemoteDataSourceImpl(client: ref.watch(networkClientProvider));
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    dataSource: ref.watch(authRemoteDataSourceProvider),
  );
}

@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl(
    dataSource: ref.watch(productRemoteDataSourceProvider),
  );
}

@riverpod
UserLoginUseCase userLoginUseCase(Ref ref){
  return UserLoginUseCase(repository: ref.watch(authRepositoryProvider));
}

@riverpod
GetAllProductsUseCase getAllProductsUseCase(Ref ref) {
  return GetAllProductsUseCase(
    repository: ref.watch(productRepositoryProvider),
  );
}

@riverpod
GetProductDetailsUseCase getProductDetailsUseCase(Ref ref) {
  return GetProductDetailsUseCase(
    repository: ref.watch(productRepositoryProvider),
  );
}

@riverpod
SearchProductUseCase searchProductUseCase(Ref ref) {
  return SearchProductUseCase(repository: ref.watch(productRepositoryProvider));
}
