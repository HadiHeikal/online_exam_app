// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'error_model.g.dart';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

@JsonSerializable()
class ErrorModel {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "code")
    int? code;

    ErrorModel({
        this.message,
        this.code,
    });

    factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);

    Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
