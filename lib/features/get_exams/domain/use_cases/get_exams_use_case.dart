import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/get_exams/domain/repo/get_exams_repo.dart';

@singleton
class GetExamsUseCase {
  GetExamsUseCase(this.getExamsRepo);
  final GetExamsRepo getExamsRepo;
  Future<BaseResponse<List<ExamEntity>>> call({
    required String subjectId,
  }) async {
    BaseResponse<List<ExamEntity>> examList = await getExamsRepo.getExams(
      subjectId: subjectId,
    );
    return examList;
  }
}
