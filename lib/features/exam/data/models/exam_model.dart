import 'package:json_annotation/json_annotation.dart';

part 'exam_model.g.dart';

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "numberOfQuestions")
  final int numberOfQuestions;

  Exam({
    required this.id,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}
