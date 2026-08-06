import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/exam/data/data_source/local/exam_attempt_local_data_source.dart';
import 'package:online_exam_app/features/exam/data/models/exam_attempt_model.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_attempt_entity.dart';
import 'package:online_exam_app/features/exam/domain/repo/exam_attempt_repo.dart';

@LazySingleton(as: ExamAttemptRepo)
class ExamAttemptRepoImpl implements ExamAttemptRepo {
  final ExamAttemptLocalDataSource examAttemptLocalDataSource;
  ExamAttemptRepoImpl(this.examAttemptLocalDataSource);

  @override
  Future<BaseResponse<bool>> saveAttempt(ExamAttemptEntity attempt) async {
    try {
      await examAttemptLocalDataSource.saveAttempt(
        ExamAttemptModel.fromEntity(attempt),
      );
      return SuccessResponse<bool>(true);
    } on Exception catch (error) {
      return ErrorResponse<bool>(error);
    }
  }

  @override
  Future<BaseResponse<List<ExamAttemptEntity>>> getAttempts() async {
    try {
      final attempts = await examAttemptLocalDataSource.getAttempts();
      return SuccessResponse<List<ExamAttemptEntity>>(
        attempts.map((attempt) => attempt.toEntity()).toList(),
      );
    } on Exception catch (error) {
      return ErrorResponse<List<ExamAttemptEntity>>(error);
    }
  }
}
