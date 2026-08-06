import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exam/data/models/answer_model.dart';
import 'package:online_exam_app/features/exam/data/models/exam_model.dart';
import 'package:online_exam_app/features/exam/domain/entities/question_entity.dart';

part 'question_model.g.dart';

@JsonSerializable()
class Question {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "question")
  final String question;
  @JsonKey(name: "answers")
  final List<Answer> answers;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "correct")
  final String correct;
  @JsonKey(name: "exam")
  final Exam exam;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    required this.exam,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionEntity toEntity() => QuestionEntity(
    questionId: id,
    questionText: question,
    questionType: type,
    answers: answers.map((answer) => answer.toEntity()).toList(),
    correctAnswer: correct,
  );
}
