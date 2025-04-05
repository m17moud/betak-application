import 'package:json_annotation/json_annotation.dart';

part "merchant_payment_model.g.dart";

@JsonSerializable()
class MerchantPaymentModel {
  String? payurl;

  MerchantPaymentModel({this.payurl});

  factory MerchantPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantPaymentModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MerchantPaymentModelToJson(this);
}
