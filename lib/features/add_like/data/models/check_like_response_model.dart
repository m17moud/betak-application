import 'package:json_annotation/json_annotation.dart';

part "check_like_response_model.g.dart";
@JsonSerializable()
class CheckLikeResponseModel {
  String? response;

  CheckLikeResponseModel({required this.response});

  factory CheckLikeResponseModel.fromJson(Map<String, dynamic> json) => _$CheckLikeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckLikeResponseModelToJson(this);
}
