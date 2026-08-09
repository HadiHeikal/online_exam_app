// To parse this JSON data, do
//
//     final examsResponce = examsResponceFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam_app/features/get_exams/data/models/exam_dto.dart';

part 'exam_responce.g.dart';

ExamsResponce examsResponceFromJson(String str) => ExamsResponce.fromJson(json.decode(str));

String examsResponceToJson(ExamsResponce data) => json.encode(data.toJson());

@JsonSerializable()
class ExamsResponce {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "metadata")
    Metadata? metadata;
    @JsonKey(name: "exams")
    List<ExamDto>? exams;

    ExamsResponce({
        this.message,
        this.metadata,
        this.exams,
    });

    factory ExamsResponce.fromJson(Map<String, dynamic> json) => _$ExamsResponceFromJson(json);

    Map<String, dynamic> toJson() => _$ExamsResponceToJson(this);
}


@JsonSerializable()
class Metadata {
    @JsonKey(name: "currentPage")
    int? currentPage;
    @JsonKey(name: "numberOfPages")
    int? numberOfPages;
    @JsonKey(name: "limit")
    int? limit;

    Metadata({
        this.currentPage,
        this.numberOfPages,
        this.limit,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

    Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
