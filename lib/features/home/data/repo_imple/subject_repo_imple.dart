
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/home/data/data_sources/remot_data_sopurce/subject_remote_data_source.dart';
import 'package:online_exam_app/features/home/data/model/subject_dto.dart';
import 'package:online_exam_app/features/home/domain/entity/subject_entity.dart';
import 'package:online_exam_app/features/home/domain/repo/subject_repo.dart';

@Injectable(as: SubjectRepo)
class SubjectRepoImple implements SubjectRepo {
 final SubjectRemoteDataSource subjectRemoteDataSource;
  SubjectRepoImple(this.subjectRemoteDataSource);

  @override
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects() async {
    BaseResponse<List<SubjectDto>> subjectBaseResponce =
        await subjectRemoteDataSource.getSubjects();
    switch (subjectBaseResponce) {
      case SuccessResponse<List<SubjectDto>>():
        final List<SubjectEntity> subjectEntityList = subjectBaseResponce.data
            .map((elemnt) {
              return elemnt.toEntity();
            })
            .toList();
        return SuccessResponse<List<SubjectEntity>>(subjectEntityList);

      case ErrorResponse<List<SubjectDto>>():
        return ErrorResponse<List<SubjectEntity>>(subjectBaseResponce.error);
    }
  }
}
