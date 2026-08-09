import 'package:json_annotation/json_annotation.dart';
import 'user_dto.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String message;
  final UserDto user;

  UserResponse({
    required this.message,
    required this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}