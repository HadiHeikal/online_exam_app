import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_stings.dart';
import 'package:online_exam_app/features/get_exams/data/models/exams_responce.dart';
import 'package:retrofit/retrofit.dart';

part 'exams_api_client.g.dart';

@singleton
@RestApi()
abstract class ExamsApiClient {
  @factoryMethod
  factory ExamsApiClient(Dio dio) = _ExamsApiClient;

  @GET(ApiStrings.examsEndPoint)
  Future<ExamsResponce> getExams({@Query('subject') required String subjectId});

}

