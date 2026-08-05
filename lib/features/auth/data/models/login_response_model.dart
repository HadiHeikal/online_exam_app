// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam_app/features/auth/data/models/user_model.dart';

part 'login_response_model.g.dart';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

@JsonSerializable()
class LoginResponseModel {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "token")
    String? token;
    @JsonKey(name: "user")
    User? user;

    LoginResponseModel({
        this.message,
        this.token,
        this.user,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

// @JsonSerializable()
// class User {
//     @JsonKey(name: "_id")
//     String? id;
//     @JsonKey(name: "username")
//     String? username;
//     @JsonKey(name: "firstName")
//     String? firstName;
//     @JsonKey(name: "lastName")
//     String? lastName;
//     @JsonKey(name: "email")
//     String? email;
//     @JsonKey(name: "phone")
//     String? phone;
//     @JsonKey(name: "role")
//     String? role;
//     @JsonKey(name: "isVerified")
//     bool? isVerified;
//     @JsonKey(name: "createdAt")
//     DateTime? createdAt;

//     User({
//         this.id,
//         this.username,
//         this.firstName,
//         this.lastName,
//         this.email,
//         this.phone,
//         this.role,
//         this.isVerified,
//         this.createdAt,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//     Map<String, dynamic> toJson() => _$UserToJson(this);


// }
