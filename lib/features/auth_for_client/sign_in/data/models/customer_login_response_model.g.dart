// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerLoginResponseModel _$CustomerLoginResponseModelFromJson(
        Map<String, dynamic> json) =>
    CustomerLoginResponseModel(
      CustomerID: json['CustomerID'] as String?,
      CustomerName: json['CustomerName'] as String?,
      CustomerMobile: json['CustomerMobile'] as String?,
      CustomerEmail: json['CustomerEmail'] as String?,
      CustomerDate: json['CustomerDate'] == null
          ? null
          : DateTime.parse(json['CustomerDate'] as String),
    );

Map<String, dynamic> _$CustomerLoginResponseModelToJson(
        CustomerLoginResponseModel instance) =>
    <String, dynamic>{
      'CustomerID': instance.CustomerID,
      'CustomerName': instance.CustomerName,
      'CustomerMobile': instance.CustomerMobile,
      'CustomerEmail': instance.CustomerEmail,
      'CustomerDate': instance.CustomerDate?.toIso8601String(),
    };
