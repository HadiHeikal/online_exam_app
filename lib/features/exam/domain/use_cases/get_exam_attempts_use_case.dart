import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_attempt_entity.dart';
import 'package:online_exam_app/features/exam/domain/repo/exam_attempt_repo.dart';

@injectable
class GetExamAttemptsUseCase {
  final ExamAttemptRepo examAttemptRepo;
  GetExamAttemptsUseCase(this.examAttemptRepo);

  Future<BaseResponse<List<ExamAttemptEntity>>> call() async {
    return examAttemptRepo.getAttempts();
  }
}
