import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/home/domain/entity/subject_entity.dart';
import 'package:online_exam_app/features/home/domain/repo/subject_repo.dart';

@injectable
class GetSubjectsUseCase {
  SubjectRepo subjectRepo;
  GetSubjectsUseCase(this.subjectRepo);

  Future<BaseResponse<List<SubjectEntity>>> call() async {
    BaseResponse<List<SubjectEntity>> subjectBaseResponce = await subjectRepo
        .getAllSubjects();
    return subjectBaseResponce;
  }
}
