// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartProduct {

 int? get id; String? get title; double? get price; int? get quantity; double? get total; double? get discountPercentage; double? get discountedTotal; String? get thumbnail;
/// Create a copy of CartProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartProductCopyWith<CartProduct> get copyWith => _$CartProductCopyWithImpl<CartProduct>(this as CartProduct, _$identity);

  /// Serializes this CartProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.total, total) || other.total == total)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.discountedTotal, discountedTotal) || other.discountedTotal == discountedTotal)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price,quantity,total,discountPercentage,discountedTotal,thumbnail);

@override
String toString() {
  return 'CartProduct(id: $id, title: $title, price: $price, quantity: $quantity, total: $total, discountPercentage: $discountPercentage, discountedTotal: $discountedTotal, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class $CartProductCopyWith<$Res>  {
  factory $CartProductCopyWith(CartProduct value, $Res Function(CartProduct) _then) = _$CartProductCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, double? price, int? quantity, double? total, double? discountPercentage, double? discountedTotal, String? thumbnail
});




}
/// @nodoc
class _$CartProductCopyWithImpl<$Res>
    implements $CartProductCopyWith<$Res> {
  _$CartProductCopyWithImpl(this._self, this._then);

  final CartProduct _self;
  final $Res Function(CartProduct) _then;

/// Create a copy of CartProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? price = freezed,Object? quantity = freezed,Object? total = freezed,Object? discountPercentage = freezed,Object? discountedTotal = freezed,Object? thumbnail = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,discountedTotal: freezed == discountedTotal ? _self.discountedTotal : discountedTotal // ignore: cast_nullable_to_non_nullable
as double?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartProduct].
extension CartProductPatterns on CartProduct {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  double? price,  int? quantity,  double? total,  double? discountPercentage,  double? discountedTotal,  String? thumbnail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartProduct() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.quantity,_that.total,_that.discountPercentage,_that.discountedTotal,_that.thumbnail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  double? price,  int? quantity,  double? total,  double? discountPercentage,  double? discountedTotal,  String? thumbnail)  $default,) {final _that = this;
switch (_that) {
case _CartProduct():
return $default(_that.id,_that.title,_that.price,_that.quantity,_that.total,_that.discountPercentage,_that.discountedTotal,_that.thumbnail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  double? price,  int? quantity,  double? total,  double? discountPercentage,  double? discountedTotal,  String? thumbnail)?  $default,) {final _that = this;
switch (_that) {
case _CartProduct() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.quantity,_that.total,_that.discountPercentage,_that.discountedTotal,_that.thumbnail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartProduct implements CartProduct {
   _CartProduct({this.id, this.title, this.price, this.quantity, this.total, this.discountPercentage, this.discountedTotal, this.thumbnail});
  factory _CartProduct.fromJson(Map<String, dynamic> json) => _$CartProductFromJson(json);

@override final  int? id;
@override final  String? title;
@override final  double? price;
@override final  int? quantity;
@override final  double? total;
@override final  double? discountPercentage;
@override final  double? discountedTotal;
@override final  String? thumbnail;

/// Create a copy of CartProduct
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.total, total) || other.total == total)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.discountedTotal, discountedTotal) || other.discountedTotal == discountedTotal)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price,quantity,total,discountPercentage,discountedTotal,thumbnail);

@override
String toString() {
  return 'CartProduct(id: $id, title: $title, price: $price, quantity: $quantity, total: $total, discountPercentage: $discountPercentage, discountedTotal: $discountedTotal, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class _$CartProductCopyWith<$Res> implements $CartProductCopyWith<$Res> {
  factory _$CartProductCopyWith(_CartProduct value, $Res Function(_CartProduct) _then) = __$CartProductCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, double? price, int? quantity, double? total, double? discountPercentage, double? discountedTotal, String? thumbnail
});




}
/// @nodoc
class __$CartProductCopyWithImpl<$Res>
    implements _$CartProductCopyWith<$Res> {
  __$CartProductCopyWithImpl(this._self, this._then);

  final _CartProduct _self;
  final $Res Function(_CartProduct) _then;

/// Create a copy of CartProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? price = freezed,Object? quantity = freezed,Object? total = freezed,Object? discountPercentage = freezed,Object? discountedTotal = freezed,Object? thumbnail = freezed,}) {
  return _then(_CartProduct(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,discountedTotal: freezed == discountedTotal ? _self.discountedTotal : discountedTotal // ignore: cast_nullable_to_non_nullable
as double?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
