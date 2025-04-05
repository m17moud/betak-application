import 'package:json_annotation/json_annotation.dart';

part "client_payment_model.g.dart";

@JsonSerializable()
class ClientPaymentModel {
  String? payurl;

  ClientPaymentModel({this.payurl});

  factory ClientPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$ClientPaymentModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ClientPaymentModelToJson(this);
}
