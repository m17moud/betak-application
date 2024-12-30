

import 'package:json_annotation/json_annotation.dart';

part "merchant_login_response_model.g.dart";


@JsonSerializable()
class MerchantLoginResponseModel {
  String? sellerId;
  String? sellerName;
  String? sellerMobile;
  String? sellerEmail;
  String? sellerFacebook;
  String? sellerProductsType;
  String? sellerAddress;
  DateTime? sellerDate;



  MerchantLoginResponseModel({
    required this.sellerId,
    required this.sellerName,
    required this.sellerMobile,
    required this.sellerEmail,
    required this.sellerFacebook,
    required this.sellerAddress,
    required this.sellerProductsType,
    required this.sellerDate,
  });

  factory MerchantLoginResponseModel.fromJson(Map<String, dynamic> json) => _$MerchantLoginResponseModelFromJson(json);


  Map<String, dynamic> toJson() => _$MerchantLoginResponseModelToJson(this);


}

