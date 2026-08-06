import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_stings.dart';
import 'package:online_exam_app/features/exam/data/models/get_all_questions_on_exam_model.dart';
import 'package:retrofit/retrofit.dart';

part 'exam_api_client.g.dart';

@singleton
@RestApi()
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio) = _ExamApiClient;

  @GET(ApiStrings.getAllQuestionsOnExamEndPoint)
  Future<GetAllQuestionsOnExamModel> getExamQuestions(
    @Query('exam') String examId,
  );
}
