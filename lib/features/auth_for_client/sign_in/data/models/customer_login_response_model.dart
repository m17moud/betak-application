

// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part "customer_login_response_model.g.dart";
@JsonSerializable()
class CustomerLoginResponseModel {
  String? CustomerID;
  String? CustomerName;
  String? CustomerMobile;
  String? CustomerEmail;
  DateTime? CustomerDate;
  CustomerLoginResponseModel({
    required this.CustomerID,
    required this.CustomerName,
    required this.CustomerMobile,
    required this.CustomerEmail,
    required this.CustomerDate,
  });
  factory CustomerLoginResponseModel.fromJson(Map<String, dynamic> json) => _$CustomerLoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerLoginResponseModelToJson(this);
}

