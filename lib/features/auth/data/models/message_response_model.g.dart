// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponseModel _$MessageResponseModelFromJson(
  Map<String, dynamic> json,
) => MessageResponseModel(
  message: json['message'] as String?,
  info: json['info'] as String?,
  statusMsg: json['statusMsg'] as String?,
);

Map<String, dynamic> _$MessageResponseModelToJson(
  MessageResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'info': instance.info,
  'statusMsg': instance.statusMsg,
};
