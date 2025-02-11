// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantLoginResponseModel _$MerchantLoginResponseModelFromJson(
        Map<String, dynamic> json) =>
    MerchantLoginResponseModel(
      SellerID: json['SellerID'] as String?,
      SellerName: json['SellerName'] as String?,
      SellerMobile: json['SellerMobile'] as String?,
      SellerEmail: json['SellerEmail'] as String?,
      SellerFacebook: json['SellerFacebook'] as String?,
      SellerAddress: json['SellerAddress'] as String?,
      SellerProductsType: json['SellerProductsType'] as String?,
      SellerDate: json['SellerDate'] == null
          ? null
          : DateTime.parse(json['SellerDate'] as String),
    );

Map<String, dynamic> _$MerchantLoginResponseModelToJson(
        MerchantLoginResponseModel instance) =>
    <String, dynamic>{
      'SellerID': instance.SellerID,
      'SellerName': instance.SellerName,
      'SellerMobile': instance.SellerMobile,
      'SellerEmail': instance.SellerEmail,
      'SellerFacebook': instance.SellerFacebook,
      'SellerProductsType': instance.SellerProductsType,
      'SellerAddress': instance.SellerAddress,
      'SellerDate': instance.SellerDate?.toIso8601String(),
    };
