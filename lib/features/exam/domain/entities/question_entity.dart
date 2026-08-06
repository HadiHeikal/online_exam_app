import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/exam/domain/entities/answers_entity.dart';

class QuestionEntity extends Equatable {
  final String questionId;
  final String questionText;
  final String questionType;
  final List<AnswersEntity> answers;

  // The backend sometimes returns more than one acceptable key here (e.g.
  // "A3,A1") even for a single_choice question, so this must be split on ','
  // rather than compared directly.
  final String correctAnswer;

  final String? selectedAnswerKey;

  const QuestionEntity({
    required this.questionId,
    required this.questionText,
    required this.questionType,
    required this.answers,
    required this.correctAnswer,
    this.selectedAnswerKey,
  });

  bool isAnswerCorrect(String answerKey) {
    return correctAnswer.split(',').map((key) => key.trim()).contains(answerKey);
  }

  bool get isAnswered => selectedAnswerKey != null;

  bool get isAnsweredCorrectly =>
      selectedAnswerKey != null && isAnswerCorrect(selectedAnswerKey!);

  QuestionEntity copyWith({
    String? questionId,
    String? questionText,
    String? questionType,
    List<AnswersEntity>? answers,
    String? correctAnswer,
    String? selectedAnswerKey,
  }) {
    return QuestionEntity(
      questionId: questionId ?? this.questionId,
      questionText: questionText ?? this.questionText,
      questionType: questionType ?? this.questionType,
      answers: answers ?? this.answers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      selectedAnswerKey: selectedAnswerKey ?? this.selectedAnswerKey,
    );
  }

  @override
  List<Object?> get props => [
    questionId,
    questionText,
    questionType,
    answers,
    correctAnswer,
    selectedAnswerKey,
  ];

  @override
  String toString() {
    return 'QuestionEntity(questionId: $questionId, questionText: $questionText, questionType: $questionType, answers: $answers, correctAnswer: $correctAnswer, selectedAnswerKey: $selectedAnswerKey)';
  }
}
