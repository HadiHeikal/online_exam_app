import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exam/data/models/question_model.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_entity.dart';

part 'get_all_questions_on_exam_model.g.dart';

@JsonSerializable()
class GetAllQuestionsOnExamModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "questions")
  final List<Question> questions;

  GetAllQuestionsOnExamModel({required this.message, required this.questions});

  factory GetAllQuestionsOnExamModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllQuestionsOnExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllQuestionsOnExamModelToJson(this);

  // The API returns a flat list of questions, each carrying its own copy of
  // the exam metadata, instead of one exam object containing its questions —
  // so the exam-level fields have to come from the first question.
  ExamEntity toEntity() {
    final examInfo = questions.first.exam;
    return ExamEntity(
      examId: examInfo.id,
      examTitle: examInfo.title,
      duration: examInfo.duration,
      numberOfQuestions: examInfo.numberOfQuestions,
      questions: questions.map((question) => question.toEntity()).toList(),
    );
  }
}
