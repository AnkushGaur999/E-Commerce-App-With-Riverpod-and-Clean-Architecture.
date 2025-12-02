import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';

part 'category_model.freezed.dart';

@freezed
abstract class CategoryModel with _$CategoryModel{
  factory CategoryModel({String? slug, String? name, String? url}) =
      _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
