import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
abstract class Meta with _$Meta {

 factory Meta({String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode}) =_Meta ;

 factory Meta.fromJson(Map<String, dynamic> json)=> _$MetaFromJson(json);

}