import 'package:json_annotation/json_annotation.dart';

part "client_check_session_response_model.g.dart";

@JsonSerializable()
class ClientCheckSessionResponseModel {
  int? status;
  String? error;

  ClientCheckSessionResponseModel({this.status, this.error});

  factory ClientCheckSessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ClientCheckSessionResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ClientCheckSessionResponseModelToJson(this);
}
