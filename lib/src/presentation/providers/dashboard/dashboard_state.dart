import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plux/src/data/models/category/category_model.dart';
import 'package:plux/src/data/models/product/product_model.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    required List<CategoryModel> categories,
    required List<ProductModel> products,
  }) = _DashboardState;
}
