// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_check_session_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantCheckSessionResponseModel _$MerchantCheckSessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    MerchantCheckSessionResponseModel(
      status: (json['status'] as num?)?.toInt(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$MerchantCheckSessionResponseModelToJson(
        MerchantCheckSessionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
    };
