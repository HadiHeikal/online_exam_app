import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exam/domain/entities/answers_entity.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_attempt_entity.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/exam/domain/entities/question_entity.dart';

part 'exam_attempt_model.g.dart';

@JsonSerializable()
class AttemptAnswerModel {
  final String answerText;
  final String answerKey;

  AttemptAnswerModel({required this.answerText, required this.answerKey});

  factory AttemptAnswerModel.fromEntity(AnswersEntity answer) =>
      AttemptAnswerModel(
        answerText: answer.answerText,
        answerKey: answer.answerKey,
      );

  factory AttemptAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AttemptAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttemptAnswerModelToJson(this);

  AnswersEntity toEntity() =>
      AnswersEntity(answerText: answerText, answerKey: answerKey);
}

@JsonSerializable()
class AttemptQuestionModel {
  final String questionId;
  final String questionText;
  final String questionType;
  final List<AttemptAnswerModel> answers;
  final String correctAnswer;
  final String? selectedAnswerKey;

  AttemptQuestionModel({
    required this.questionId,
    required this.questionText,
    required this.questionType,
    required this.answers,
    required this.correctAnswer,
    this.selectedAnswerKey,
  });

  factory AttemptQuestionModel.fromEntity(QuestionEntity question) =>
      AttemptQuestionModel(
        questionId: question.questionId,
        questionText: question.questionText,
        questionType: question.questionType,
        answers: question.answers
            .map((answer) => AttemptAnswerModel.fromEntity(answer))
            .toList(),
        correctAnswer: question.correctAnswer,
        selectedAnswerKey: question.selectedAnswerKey,
      );

  factory AttemptQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$AttemptQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttemptQuestionModelToJson(this);

  QuestionEntity toEntity() => QuestionEntity(
    questionId: questionId,
    questionText: questionText,
    questionType: questionType,
    answers: answers.map((answer) => answer.toEntity()).toList(),
    correctAnswer: correctAnswer,
    selectedAnswerKey: selectedAnswerKey,
  );
}

@JsonSerializable()
class ExamAttemptModel {
  final String attemptId;
  final String examId;
  final String examTitle;
  final int duration;
  final int numberOfQuestions;
  final String subject;
  final DateTime completedAt;
  final int timeTakenInSeconds;
  final List<AttemptQuestionModel> questions;

  ExamAttemptModel({
    required this.attemptId,
    required this.examId,
    required this.examTitle,
    required this.duration,
    required this.numberOfQuestions,
    required this.subject,
    required this.completedAt,
    required this.timeTakenInSeconds,
    required this.questions,
  });

  factory ExamAttemptModel.fromEntity(ExamAttemptEntity attempt) =>
      ExamAttemptModel(
        attemptId: attempt.attemptId,
        examId: attempt.exam.examId,
        examTitle: attempt.exam.examTitle,
        duration: attempt.exam.duration,
        numberOfQuestions: attempt.exam.numberOfQuestions,
        subject: attempt.subject,
        completedAt: attempt.completedAt,
        timeTakenInSeconds: attempt.timeTaken.inSeconds,
        questions: attempt.exam.questions
            .map((question) => AttemptQuestionModel.fromEntity(question))
            .toList(),
      );

  factory ExamAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$ExamAttemptModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamAttemptModelToJson(this);

  ExamAttemptEntity toEntity() => ExamAttemptEntity(
    attemptId: attemptId,
    subject: subject,
    completedAt: completedAt,
    timeTaken: Duration(seconds: timeTakenInSeconds),
    exam: ExamEntity(
      examId: examId,
      examTitle: examTitle,
      duration: duration,
      numberOfQuestions: numberOfQuestions,
      questions: questions.map((question) => question.toEntity()).toList(),
    ),
  );
}
