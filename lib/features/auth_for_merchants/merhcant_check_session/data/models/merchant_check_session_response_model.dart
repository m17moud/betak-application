import 'package:json_annotation/json_annotation.dart';

part "merchant_check_session_response_model.g.dart";

@JsonSerializable()
class MerchantCheckSessionResponseModel {
  int? status;
  String? error;

  MerchantCheckSessionResponseModel({this.status, this.error});

  factory MerchantCheckSessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantCheckSessionResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MerchantCheckSessionResponseModelToJson(this);
}
