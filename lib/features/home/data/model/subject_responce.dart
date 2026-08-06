// To parse this JSON data, do
//
//     final subjectResponce = subjectResponceFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home/data/model/subject_dto.dart';
import 'dart:convert';



part 'subject_responce.g.dart';

SubjectResponce subjectResponceFromJson(String str) => SubjectResponce.fromJson(json.decode(str));

String subjectResponceToJson(SubjectResponce data) => json.encode(data.toJson());

@JsonSerializable()
class SubjectResponce {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "metadata")
    Metadata? metadata;
    @JsonKey(name: "subjects")
    List<SubjectDto>? subjects;

    SubjectResponce({
        this.message,
        this.metadata,
        this.subjects,
    });

    factory SubjectResponce.fromJson(Map<String, dynamic> json) => _$SubjectResponceFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectResponceToJson(this);
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


