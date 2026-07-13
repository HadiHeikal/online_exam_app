import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  AuthEntity toEntity() => AuthEntity(
    username: username??"",
    firstName: firstName??"",
    lastName: lastName??"",
    email: email??"",
    phone: phone??"",
    id: id??"",
    role: role??"",
    isVerified: isVerified??false,
    createdAt: createdAt??DateTime.now(),
  );
}
