// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkClient)
const networkClientProvider = NetworkClientProvider._();

final class NetworkClientProvider
    extends $FunctionalProvider<NetworkClient, NetworkClient, NetworkClient>
    with $Provider<NetworkClient> {
  const NetworkClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkClientHash();

  @$internal
  @override
  $ProviderElement<NetworkClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkClient create(Ref ref) {
    return networkClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkClient>(value),
    );
  }
}

String _$networkClientHash() => r'5798aa81aac47d529bee9048150b2fb906605212';

@ProviderFor(productRemoteDataSource)
const productRemoteDataSourceProvider = ProductRemoteDataSourceProvider._();

final class ProductRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ProductRemoteDataSource,
          ProductRemoteDataSource,
          ProductRemoteDataSource
        >
    with $Provider<ProductRemoteDataSource> {
  const ProductRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ProductRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRemoteDataSource create(Ref ref) {
    return productRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRemoteDataSource>(value),
    );
  }
}

String _$productRemoteDataSourceHash() =>
    r'1420546ae4e4593d88bad52831672dd5604f454c';

@ProviderFor(productRepository)
const productRepositoryProvider = ProductRepositoryProvider._();

final class ProductRepositoryProvider
    extends
        $FunctionalProvider<
          ProductRepository,
          ProductRepository,
          ProductRepository
        >
    with $Provider<ProductRepository> {
  const ProductRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRepository create(Ref ref) {
    return productRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRepository>(value),
    );
  }
}

String _$productRepositoryHash() => r'5f777787eb8ae58ba08c1f3bddf9ef21bf18ca25';

@ProviderFor(getAllProductsUseCase)
const getAllProductsUseCaseProvider = GetAllProductsUseCaseProvider._();

final class GetAllProductsUseCaseProvider
    extends
        $FunctionalProvider<
          GetAllProductsUseCase,
          GetAllProductsUseCase,
          GetAllProductsUseCase
        >
    with $Provider<GetAllProductsUseCase> {
  const GetAllProductsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllProductsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllProductsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetAllProductsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAllProductsUseCase create(Ref ref) {
    return getAllProductsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAllProductsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAllProductsUseCase>(value),
    );
  }
}

String _$getAllProductsUseCaseHash() =>
    r'7416567949c4c2d82a8c5779fbdbcedf97d80d92';

@ProviderFor(getProductDetailsUseCase)
const getProductDetailsUseCaseProvider = GetProductDetailsUseCaseProvider._();

final class GetProductDetailsUseCaseProvider
    extends
        $FunctionalProvider<
          GetProductDetailsUseCase,
          GetProductDetailsUseCase,
          GetProductDetailsUseCase
        >
    with $Provider<GetProductDetailsUseCase> {
  const GetProductDetailsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductDetailsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductDetailsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProductDetailsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductDetailsUseCase create(Ref ref) {
    return getProductDetailsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductDetailsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductDetailsUseCase>(value),
    );
  }
}

String _$getProductDetailsUseCaseHash() =>
    r'e6d08ff15043a6beff14989d973d0a477f49a59e';

@ProviderFor(searchProductUseCase)
const searchProductUseCaseProvider = SearchProductUseCaseProvider._();

final class SearchProductUseCaseProvider
    extends
        $FunctionalProvider<
          SearchProductUseCase,
          SearchProductUseCase,
          SearchProductUseCase
        >
    with $Provider<SearchProductUseCase> {
  const SearchProductUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchProductUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchProductUseCaseHash();

  @$internal
  @override
  $ProviderElement<SearchProductUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchProductUseCase create(Ref ref) {
    return searchProductUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchProductUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchProductUseCase>(value),
    );
  }
}

String _$searchProductUseCaseHash() =>
    r'46022b6cd92e93b2a343b452a8cd1a230992533e';
