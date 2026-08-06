import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/home/data/model/subject_dto.dart';


abstract interface class SubjectRemoteDataSource {
  Future<BaseResponse<List<SubjectDto>>> getSubjects();
}
