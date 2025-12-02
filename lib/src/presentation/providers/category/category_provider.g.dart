// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Category)
const categoryProvider = CategoryProvider._();

final class CategoryProvider
    extends $AsyncNotifierProvider<Category, CategoryState> {
  const CategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryHash();

  @$internal
  @override
  Category create() => Category();
}

String _$categoryHash() => r'f9710538a5bffb3957c20d705368dc6025c8042d';

abstract class _$Category extends $AsyncNotifier<CategoryState> {
  FutureOr<CategoryState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<CategoryState>, CategoryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CategoryState>, CategoryState>,
              AsyncValue<CategoryState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
