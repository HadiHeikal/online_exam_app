import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/get_exams/data/data_source/remote/get_exams_remote_data_source.dart';
import 'package:online_exam_app/features/get_exams/data/models/exams_dto.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/get_exams/domain/repo/get_exams_repo.dart';

@LazySingleton(as: GetExamsRepo)
class GetExamsRepoImple implements GetExamsRepo {
  GetExamsRemoteDataSource getExamsRemoteDataSource;
  GetExamsRepoImple(this.getExamsRemoteDataSource);

  @override
  Future<BaseResponse<List<ExamEntity>>> getExams({
    required String subjectId,
  }) async {
    final examsResponse = await getExamsRemoteDataSource
        .getExams(subjectId: subjectId);
    switch (examsResponse) {
      case SuccessResponse<List<ExamsDto>>():
        List<ExamEntity> examsListEntity = examsResponse.data.map((e) {
          return e.toDomain();
        }).toList();
        return SuccessResponse<List<ExamEntity>>(examsListEntity);


      case ErrorResponse<List<ExamsDto>>():
        return ErrorResponse<List<ExamEntity>>(examsResponse.error);
    }
  }
}
