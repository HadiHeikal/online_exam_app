// To parse this JSON data, do
//
//     final examsDto = examsDtoFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';

part 'exams_dto.g.dart';

ExamsDto examsDtoFromJson(String str) => ExamsDto.fromJson(json.decode(str));

String examsDtoToJson(ExamsDto data) => json.encode(data.toJson());

@JsonSerializable()
class ExamsDto {
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

  ExamsDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamsDto.fromJson(Map<String, dynamic> json) =>
      _$ExamsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsDtoToJson(this);

  ExamEntity toDomain() => ExamEntity(
    id: id ?? "",
    title: title ?? "",
    duration: duration ?? 0,
    subject: subject ?? "",
    numberOfQuestions: numberOfQuestions ?? 0,
  );
}
