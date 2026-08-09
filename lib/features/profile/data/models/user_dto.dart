import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/profile/domain/entities/user_entity.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: '_id')
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  @JsonKey(defaultValue: false)
  final bool isVerified;
  final String createdAt;
  @JsonKey(defaultValue: false)
  final bool resetCodeVerified;

  UserDto({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,

    required this.isVerified,
    required this.createdAt,
    required this.resetCodeVerified,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  UserEntity toEntity() => UserEntity(
    username: username,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    id: id,
  );
}