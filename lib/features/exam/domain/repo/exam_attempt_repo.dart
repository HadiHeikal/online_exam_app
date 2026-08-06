import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_attempt_entity.dart';

abstract interface class ExamAttemptRepo {
  Future<BaseResponse<bool>> saveAttempt(ExamAttemptEntity attempt);

  Future<BaseResponse<List<ExamAttemptEntity>>> getAttempts();
}
