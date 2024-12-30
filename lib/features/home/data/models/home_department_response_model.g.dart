// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_department_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDepartmentResponseModel _$HomeDepartmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeDepartmentResponseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$HomeDepartmentResponseModelToJson(
        HomeDepartmentResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
