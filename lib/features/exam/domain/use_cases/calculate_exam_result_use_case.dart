import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_result_entity.dart';

@injectable
class CalculateExamResultUseCase {
  ExamResultEntity call(ExamEntity exam) {
    final correctCount = exam.questions
        .where((question) => question.isAnsweredCorrectly)
        .length;

    return ExamResultEntity(
      correctAnswersCount: correctCount,
      incorrectAnswersCount: exam.questions.length - correctCount,
      totalQuestions: exam.questions.length,
    );
  }
}
