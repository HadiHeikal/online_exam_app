// To parse this JSON data, do
//
//     final examsDto = examsDtoFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';

part 'exam_dto.g.dart';

ExamDto examsDtoFromJson(String str) => ExamDto.fromJson(json.decode(str));

String examsDtoToJson(ExamDto data) => json.encode(data.toJson());

@JsonSerializable()
class ExamDto {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "numberOfQuestions")
  int? numberOfQuestions;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  ExamDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);

  ExamEntity toDomain() => ExamEntity(
    id: id ?? "",
    title: title ?? "",
    duration: duration ?? 0,
    subject: subject ?? "",
    numberOfQuestions: numberOfQuestions ?? 0,
  );
}
