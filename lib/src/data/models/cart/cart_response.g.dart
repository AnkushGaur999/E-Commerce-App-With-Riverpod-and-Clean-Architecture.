// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartProduct _$CartProductFromJson(Map<String, dynamic> json) => _CartProduct(
  id: (json['id'] as num?)?.toInt(),
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toDouble(),
  discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
  userId: (json['userId'] as num?)?.toInt(),
  totalProducts: (json['totalProducts'] as num?)?.toInt(),
  totalQuantity: (json['totalQuantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$CartProductToJson(_CartProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'products': instance.products,
      'total': instance.total,
      'discountedTotal': instance.discountedTotal,
      'userId': instance.userId,
      'totalProducts': instance.totalProducts,
      'totalQuantity': instance.totalQuantity,
    };
