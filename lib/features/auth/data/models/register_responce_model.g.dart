// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponceModel _$RegisterResponceModelFromJson(
  Map<String, dynamic> json,
) => RegisterResponceModel(
  message: json['message'] as String?,
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterResponceModelToJson(
  RegisterResponceModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'user': instance.user,
};
