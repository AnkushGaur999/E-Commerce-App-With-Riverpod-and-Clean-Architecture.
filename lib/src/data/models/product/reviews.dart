import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviews.freezed.dart';
part 'reviews.g.dart';

@freezed
abstract class Reviews with _$Reviews {

  factory Reviews({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail
})= _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json)=> _$ReviewsFromJson(json);

}