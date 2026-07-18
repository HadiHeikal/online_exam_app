import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/message_entity.dart';

part 'message_response_model.g.dart';

@JsonSerializable()
class MessageResponseModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "info")
  String? info;
  @JsonKey(name: "statusMsg")
  String? statusMsg;

  MessageResponseModel({
    this.message,
    this.info,
    this.statusMsg,
  });

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseModelToJson(this);

  MessageEntity toEntity() {
    return MessageEntity(
      message: message ?? '',
      info: info,
    );
  }
}
