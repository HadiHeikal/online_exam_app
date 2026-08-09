import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/get_exams/api/client/exams_api_client.dart';
import 'package:online_exam_app/features/get_exams/data/data_source/remote/get_exams_remote_data_source.dart';
import 'package:online_exam_app/features/get_exams/data/models/exam_dto.dart';
import 'package:online_exam_app/features/get_exams/data/models/exam_responce.dart';

@Injectable(as: GetExamsRemoteDataSource)
class GetExamsRemoteDataSourceImple implements GetExamsRemoteDataSource {
  final ExamsApiClient getExamsApiClient;
  GetExamsRemoteDataSourceImple(this.getExamsApiClient);

  @override
  Future<BaseResponse<List<ExamDto>>> getExams({required String subjectId}) async{
   try {
     ExamsResponce examsResponce = await getExamsApiClient.getExams(subjectId: subjectId);
     return SuccessResponse<List<ExamDto>>(examsResponce.exams ?? []);
   } on Exception catch (e) {
     return ErrorResponse<List<ExamDto>>(e);
   }
  }


}
