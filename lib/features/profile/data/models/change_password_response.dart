// To parse this JSON data, do
//
//     final changePasswordResponse = changePasswordResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam_app/features/profile/domain/entities/password_entity.dart';

part 'change_password_response.g.dart';

ChangePasswordResponse changePasswordResponseFromJson(String str) =>
    ChangePasswordResponse.fromJson(json.decode(str));

String changePasswordResponseToJson(ChangePasswordResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ChangePasswordResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;

  ChangePasswordResponse({this.message, this.token});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);

  PasswordEntity toEntity() =>
      PasswordEntity(message: message ?? "", token: token ?? "");
}
