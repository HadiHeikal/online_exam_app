import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/exam/domain/entities/question_entity.dart';

class ExamEntity extends Equatable {
  final String examId;
  final String examTitle;
  final int duration;
  final int numberOfQuestions;

  final List<QuestionEntity> questions;

  const ExamEntity({
    required this.examId,
    required this.examTitle,
    required this.numberOfQuestions,
    required this.duration,
    required this.questions,
  });

  ExamEntity copyWith({
    String? examId,
    String? examTitle,
    int? duration,
    int? numberOfQuestions,
    List<QuestionEntity>? questions,
  }) {
    return ExamEntity(
      examId: examId ?? this.examId,
      examTitle: examTitle ?? this.examTitle,
      duration: duration ?? this.duration,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      questions: questions ?? this.questions,
    );
  }

  @override
  List<Object?> get props => [
    examId,
    examTitle,
    duration,
    numberOfQuestions,
    questions,
  ];

  // toString method for debugging purposes
  @override
  String toString() {
    return 'ExamEntity(examId: $examId, examTitle: $examTitle, duration: $duration, numberOfQuestions: $numberOfQuestions, questions: $questions)';
  }
}
