import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/exam/data/models/get_all_questions_on_exam_model.dart';

abstract interface class ExamRemoteDataSource {
  Future<BaseResponse<GetAllQuestionsOnExamModel>> getExamQuestions(
    String examId,
  );
}
