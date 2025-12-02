import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plux/src/data/models/category/category_model.dart';

part 'category_state.freezed.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  const factory CategoryState({required List<CategoryModel> categories}) =
      _CategoryState;
}
