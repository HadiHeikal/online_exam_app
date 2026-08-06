import 'package:online_exam_app/features/exam/data/models/exam_attempt_model.dart';

abstract interface class ExamAttemptLocalDataSource {
  Future<void> saveAttempt(ExamAttemptModel attempt);
  Future<List<ExamAttemptModel>> getAttempts();
}
