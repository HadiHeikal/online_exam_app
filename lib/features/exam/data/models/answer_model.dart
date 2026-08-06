// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exam/domain/entities/answers_entity.dart';

part 'answer_model.g.dart';

@JsonSerializable()
class Answer {
  @JsonKey(name: "answer")
  final String answer;
  @JsonKey(name: "key")
  final String key;

  Answer({required this.answer, required this.key});

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  AnswersEntity toEntity() => AnswersEntity(answerText: answer, answerKey: key);
}
