import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_stings.dart';
import 'package:online_exam_app/features/home/data/model/subject_responce.dart';
import 'package:retrofit/retrofit.dart';

part 'subject_api_client.g.dart';

@singleton
@RestApi()
abstract class SubjectApiClient {
  @factoryMethod
  factory SubjectApiClient(Dio dio) = _SubjectApiClient;

  @GET(ApiStrings.subjectEndPoint)
  Future<SubjectResponce> getSubjects();
}
