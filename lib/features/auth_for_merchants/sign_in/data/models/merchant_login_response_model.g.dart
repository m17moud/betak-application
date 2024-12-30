// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantLoginResponseModel _$MerchantLoginResponseModelFromJson(
        Map<String, dynamic> json) =>
    MerchantLoginResponseModel(
      sellerId: json['sellerId'] as String?,
      sellerName: json['sellerName'] as String?,
      sellerMobile: json['sellerMobile'] as String?,
      sellerEmail: json['sellerEmail'] as String?,
      sellerFacebook: json['sellerFacebook'] as String?,
      sellerAddress: json['sellerAddress'] as String?,
      sellerProductsType: json['sellerProductsType'] as String?,
      sellerDate: json['sellerDate'] == null
          ? null
          : DateTime.parse(json['sellerDate'] as String),
    );

Map<String, dynamic> _$MerchantLoginResponseModelToJson(
        MerchantLoginResponseModel instance) =>
    <String, dynamic>{
      'sellerId': instance.sellerId,
      'sellerName': instance.sellerName,
      'sellerMobile': instance.sellerMobile,
      'sellerEmail': instance.sellerEmail,
      'sellerFacebook': instance.sellerFacebook,
      'sellerProductsType': instance.sellerProductsType,
      'sellerAddress': instance.sellerAddress,
      'sellerDate': instance.sellerDate?.toIso8601String(),
    };
