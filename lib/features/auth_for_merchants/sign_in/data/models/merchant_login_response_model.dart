// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part "merchant_login_response_model.g.dart";

@JsonSerializable()
class MerchantLoginResponseModel {
  String? SellerID;
  String? SellerName;
  String? SellerMobile;
  String? SellerEmail;
  String? SellerFacebook;
  String? SellerProductsType;
  String? SellerAddress;
  String? SellerDepartment;
  DateTime? SellerDate;
  String? sessionid;


  MerchantLoginResponseModel({
    required this.SellerID,
    required this.SellerName,
    required this.SellerMobile,
    required this.SellerEmail,
    required this.SellerFacebook,
    required this.SellerAddress,
    required this.SellerProductsType,
    required this.SellerDate,
    required this.SellerDepartment,
    required this.sessionid
  });

  factory MerchantLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantLoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantLoginResponseModelToJson(this);
}
