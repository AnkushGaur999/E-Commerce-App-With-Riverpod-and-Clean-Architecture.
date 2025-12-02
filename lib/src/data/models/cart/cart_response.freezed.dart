// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CartResponse _$CartResponseFromJson(
  Map<String, dynamic> json
) {
    return _CartProduct.fromJson(
      json
    );
}

/// @nodoc
mixin _$CartResponse {

 int? get id; List<CartProduct>? get products; double? get total; double? get discountedTotal; int? get userId; int? get totalProducts; int? get totalQuantity;
/// Create a copy of CartResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartResponseCopyWith<CartResponse> get copyWith => _$CartResponseCopyWithImpl<CartResponse>(this as CartResponse, _$identity);

  /// Serializes this CartResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.total, total) || other.total == total)&&(identical(other.discountedTotal, discountedTotal) || other.discountedTotal == discountedTotal)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(products),total,discountedTotal,userId,totalProducts,totalQuantity);

@override
String toString() {
  return 'CartResponse(id: $id, products: $products, total: $total, discountedTotal: $discountedTotal, userId: $userId, totalProducts: $totalProducts, totalQuantity: $totalQuantity)';
}


}

/// @nodoc
abstract mixin class $CartResponseCopyWith<$Res>  {
  factory $CartResponseCopyWith(CartResponse value, $Res Function(CartResponse) _then) = _$CartResponseCopyWithImpl;
@useResult
$Res call({
 int? id, List<CartProduct>? products, double? total, double? discountedTotal, int? userId, int? totalProducts, int? totalQuantity
});




}
/// @nodoc
class _$CartResponseCopyWithImpl<$Res>
    implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._self, this._then);

  final CartResponse _self;
  final $Res Function(CartResponse) _then;

/// Create a copy of CartResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? products = freezed,Object? total = freezed,Object? discountedTotal = freezed,Object? userId = freezed,Object? totalProducts = freezed,Object? totalQuantity = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,products: freezed == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<CartProduct>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,discountedTotal: freezed == discountedTotal ? _self.discountedTotal : discountedTotal // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,totalProducts: freezed == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int?,totalQuantity: freezed == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartResponse].
extension CartResponsePatterns on CartResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartProduct() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartProduct value)  $default,){
final _that = this;
switch (_that) {
case _CartProduct():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartProduct value)?  $default,){
final _that = this;
switch (_that) {
case _CartProduct() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  List<CartProduct>? products,  double? total,  double? discountedTotal,  int? userId,  int? totalProducts,  int? totalQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartProduct() when $default != null:
return $default(_that.id,_that.products,_that.total,_that.discountedTotal,_that.userId,_that.totalProducts,_that.totalQuantity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  List<CartProduct>? products,  double? total,  double? discountedTotal,  int? userId,  int? totalProducts,  int? totalQuantity)  $default,) {final _that = this;
switch (_that) {
case _CartProduct():
return $default(_that.id,_that.products,_that.total,_that.discountedTotal,_that.userId,_that.totalProducts,_that.totalQuantity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  List<CartProduct>? products,  double? total,  double? discountedTotal,  int? userId,  int? totalProducts,  int? totalQuantity)?  $default,) {final _that = this;
switch (_that) {
case _CartProduct() when $default != null:
return $default(_that.id,_that.products,_that.total,_that.discountedTotal,_that.userId,_that.totalProducts,_that.totalQuantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartProduct implements CartResponse {
   _CartProduct({this.id, final  List<CartProduct>? products, this.total, this.discountedTotal, this.userId, this.totalProducts, this.totalQuantity}): _products = products;
  factory _CartProduct.fromJson(Map<String, dynamic> json) => _$CartProductFromJson(json);

@override final  int? id;
 final  List<CartProduct>? _products;
@override List<CartProduct>? get products {
  final value = _products;
  if (value == null) return null;
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? total;
@override final  double? discountedTotal;
@override final  int? userId;
@override final  int? totalProducts;
@override final  int? totalQuantity;

/// Create a copy of CartResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartProductCopyWith<_CartProduct> get copyWith => __$CartProductCopyWithImpl<_CartProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartProduct&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.total, total) || other.total == total)&&(identical(other.discountedTotal, discountedTotal) || other.discountedTotal == discountedTotal)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_products),total,discountedTotal,userId,totalProducts,totalQuantity);

@override
String toString() {
  return 'CartResponse(id: $id, products: $products, total: $total, discountedTotal: $discountedTotal, userId: $userId, totalProducts: $totalProducts, totalQuantity: $totalQuantity)';
}


}

/// @nodoc
abstract mixin class _$CartProductCopyWith<$Res> implements $CartResponseCopyWith<$Res> {
  factory _$CartProductCopyWith(_CartProduct value, $Res Function(_CartProduct) _then) = __$CartProductCopyWithImpl;
@override @useResult
$Res call({
 int? id, List<CartProduct>? products, double? total, double? discountedTotal, int? userId, int? totalProducts, int? totalQuantity
});




}
/// @nodoc
class __$CartProductCopyWithImpl<$Res>
    implements _$CartProductCopyWith<$Res> {
  __$CartProductCopyWithImpl(this._self, this._then);

  final _CartProduct _self;
  final $Res Function(_CartProduct) _then;

/// Create a copy of CartResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? products = freezed,Object? total = freezed,Object? discountedTotal = freezed,Object? userId = freezed,Object? totalProducts = freezed,Object? totalQuantity = freezed,}) {
  return _then(_CartProduct(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,products: freezed == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<CartProduct>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,discountedTotal: freezed == discountedTotal ? _self.discountedTotal : discountedTotal // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,totalProducts: freezed == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int?,totalQuantity: freezed == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
