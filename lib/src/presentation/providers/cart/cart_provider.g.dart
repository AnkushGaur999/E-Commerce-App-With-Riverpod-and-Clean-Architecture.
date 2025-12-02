// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Cart)
const cartProvider = CartProvider._();

final class CartProvider extends $AsyncNotifierProvider<Cart, CartResponse> {
  const CartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartHash();

  @$internal
  @override
  Cart create() => Cart();
}

String _$cartHash() => r'2e96cee9fe09d65f52a0edc70a356fc9655565c8';

abstract class _$Cart extends $AsyncNotifier<CartResponse> {
  FutureOr<CartResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<CartResponse>, CartResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CartResponse>, CartResponse>,
              AsyncValue<CartResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
