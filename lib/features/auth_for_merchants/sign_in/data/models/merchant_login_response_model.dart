

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
  DateTime? SellerDate;



  MerchantLoginResponseModel({
    required this.SellerID,
    required this.SellerName,
    required this.SellerMobile,
    required this.SellerEmail,
    required this.SellerFacebook,
    required this.SellerAddress,
    required this.SellerProductsType,
    required this.SellerDate,
  });

  factory MerchantLoginResponseModel.fromJson(Map<String, dynamic> json) => _$MerchantLoginResponseModelFromJson(json);


  Map<String, dynamic> toJson() => _$MerchantLoginResponseModelToJson(this);


}

