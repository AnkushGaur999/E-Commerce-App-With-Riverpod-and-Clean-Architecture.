// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AllProduct)
const allProductProvider = AllProductProvider._();

final class AllProductProvider
    extends $AsyncNotifierProvider<AllProduct, AllProductState> {
  const AllProductProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allProductProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allProductHash();

  @$internal
  @override
  AllProduct create() => AllProduct();
}

String _$allProductHash() => r'ab3b7f7a5f667e5f07a51916dd716410aa5b5faf';

abstract class _$AllProduct extends $AsyncNotifier<AllProductState> {
  FutureOr<AllProductState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AllProductState>, AllProductState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AllProductState>, AllProductState>,
              AsyncValue<AllProductState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SearchProduct)
const searchProductProvider = SearchProductProvider._();

final class SearchProductProvider
    extends $AsyncNotifierProvider<SearchProduct, SearchProductState?> {
  const SearchProductProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchProductProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchProductHash();

  @$internal
  @override
  SearchProduct create() => SearchProduct();
}

String _$searchProductHash() => r'7d9ed059b77e44389e7c32d3fbb75d59c77106a8';

abstract class _$SearchProduct extends $AsyncNotifier<SearchProductState?> {
  FutureOr<SearchProductState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SearchProductState?>, SearchProductState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SearchProductState?>, SearchProductState?>,
              AsyncValue<SearchProductState?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
