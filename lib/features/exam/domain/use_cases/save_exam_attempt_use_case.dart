import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_attempt_entity.dart';
import 'package:online_exam_app/features/exam/domain/repo/exam_attempt_repo.dart';

@injectable
class SaveExamAttemptUseCase {
  final ExamAttemptRepo examAttemptRepo;
  SaveExamAttemptUseCase(this.examAttemptRepo);

  Future<BaseResponse<bool>> call(ExamAttemptEntity attempt) async {
    return examAttemptRepo.saveAttempt(attempt);
  }
}
