import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_entity.dart';

abstract interface class ExamRepo {
  Future<BaseResponse<ExamEntity>> getExamById(String examId);
}
