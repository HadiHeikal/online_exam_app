import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/exam/api/client/exam_api_client.dart';
import 'package:online_exam_app/features/exam/data/data_source/remote/exam_remote_data_source.dart';
import 'package:online_exam_app/features/exam/data/models/get_all_questions_on_exam_model.dart';

@LazySingleton(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ExamApiClient examApiClient;
  ExamRemoteDataSourceImpl(this.examApiClient);

  @override
  Future<BaseResponse<GetAllQuestionsOnExamModel>> getExamQuestions(
    String examId,
  ) async {
    try {
      GetAllQuestionsOnExamModel getAllQuestionsOnExamModel = await examApiClient
          .getExamQuestions(examId);
      return SuccessResponse<GetAllQuestionsOnExamModel>(
        getAllQuestionsOnExamModel,
      );
    } on DioException catch (dioException) {
      return ErrorResponse<GetAllQuestionsOnExamModel>(dioException);
    }
  }
}
