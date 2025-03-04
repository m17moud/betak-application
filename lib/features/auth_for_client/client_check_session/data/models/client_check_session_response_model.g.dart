// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_check_session_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientCheckSessionResponseModel _$ClientCheckSessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    ClientCheckSessionResponseModel(
      status: (json['status'] as num?)?.toInt(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ClientCheckSessionResponseModelToJson(
        ClientCheckSessionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
    };
