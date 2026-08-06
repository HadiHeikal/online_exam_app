import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/exam/domain/repo/exam_repo.dart';

@injectable
class GetExamByIdUseCase {
  final ExamRepo examRepo;
  GetExamByIdUseCase(this.examRepo);

  Future<BaseResponse<ExamEntity>> call(String examId) async {
    return examRepo.getExamById(examId);
  }
}
