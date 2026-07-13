// To parse this JSON data, do
//
//     final registerRequestModel = registerRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'register_request_model.g.dart';

RegisterRequestModel registerRequestModelFromJson(String str) => RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) => json.encode(data.toJson());

@JsonSerializable()
class RegisterRequestModel {
    @JsonKey(name: "username")
    String? username;
    @JsonKey(name: "firstName")
    String? firstName;
    @JsonKey(name: "lastName")
    String? lastName;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "rePassword")
    String? rePassword;
    @JsonKey(name: "phone")
    String? phone;

    RegisterRequestModel({
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.rePassword,
        this.phone,
    });

    factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);

    Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
