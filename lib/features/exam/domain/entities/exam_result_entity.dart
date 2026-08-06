import 'package:equatable/equatable.dart';

class ExamResultEntity extends Equatable {
  final int correctAnswersCount;
  final int incorrectAnswersCount;
  final int totalQuestions;

  const ExamResultEntity({
    required this.correctAnswersCount,
    required this.incorrectAnswersCount,
    required this.totalQuestions,
  });

  double get scorePercentage =>
      totalQuestions == 0 ? 0 : (correctAnswersCount / totalQuestions) * 100;

  @override
  List<Object?> get props => [
    correctAnswersCount,
    incorrectAnswersCount,
    totalQuestions,
  ];

  @override
  String toString() {
    return 'ExamResultEntity(correctAnswersCount: $correctAnswersCount, incorrectAnswersCount: $incorrectAnswersCount, totalQuestions: $totalQuestions)';
  }
}
