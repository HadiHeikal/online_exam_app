import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';

abstract interface class GetExamsRepo {

  Future<BaseResponse<List<ExamEntity>>> getExams({required String subjectId});
}
