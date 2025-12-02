
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plux/src/data/models/cart/cart_product.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
abstract class CartResponse with _$CartResponse {
  factory CartResponse({
    int? id,
    List<CartProduct>? products,
    double? total,
    double? discountedTotal,
    int? userId,
    int? totalProducts,
    int? totalQuantity,
}) = _CartProduct;

  factory CartResponse.fromJson(Map<String, dynamic> json) => _$CartResponseFromJson(json);


}