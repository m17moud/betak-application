import 'package:json_annotation/json_annotation.dart';

part "home_department_response_model.g.dart";
@JsonSerializable()
class HomeDepartmentResponseModel {
  String? id;
  String? name;
  String? description;
  String? image;

  HomeDepartmentResponseModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});
        factory HomeDepartmentResponseModel.fromJson(Map<String, dynamic> json) => _$HomeDepartmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDepartmentResponseModelToJson(this);
}
