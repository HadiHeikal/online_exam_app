import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/get_exams/data/models/exam_dto.dart';



abstract interface class GetExamsRemoteDataSource {
  Future<BaseResponse<List<ExamDto>>> getExams({required String subjectId });
}
