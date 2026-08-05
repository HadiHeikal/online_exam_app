// To parse this JSON data, do
//
//     final registerResponceModel = registerResponceModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam_app/features/auth/data/models/user_model.dart';

part 'register_responce_model.g.dart';

RegisterResponceModel registerResponceModelFromJson(String str) => RegisterResponceModel.fromJson(json.decode(str));

String registerResponceModelToJson(RegisterResponceModel data) => json.encode(data.toJson());

@JsonSerializable()
class RegisterResponceModel {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "token")
    String? token;
    @JsonKey(name: "user")
    User? user;

    RegisterResponceModel({
        this.message,
        this.token,
        this.user,
    });

    factory RegisterResponceModel.fromJson(Map<String, dynamic> json) => _$RegisterResponceModelFromJson(json);

    Map<String, dynamic> toJson() => _$RegisterResponceModelToJson(this);
}

