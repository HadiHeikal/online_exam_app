// To parse this JSON data, do
//
//     final subjectDto = subjectDtoFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam_app/features/home/domain/entity/subject_entity.dart';

part 'subject_dto.g.dart';

SubjectDto subjectDtoFromJson(String str) => SubjectDto.fromJson(json.decode(str));

String subjectDtoToJson(SubjectDto data) => json.encode(data.toJson());

@JsonSerializable()
class SubjectDto {
    @JsonKey(name: "_id")
    String? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "icon")
    String? icon;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;

    SubjectDto({
        this.id,
        this.name,
        this.icon,
        this.createdAt,
    });

    factory SubjectDto.fromJson(Map<String, dynamic> json) => _$SubjectDtoFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectDtoToJson(this);

    SubjectEntity toEntity() => SubjectEntity(id: id??"", name: name??"", icon: icon??"");
}
