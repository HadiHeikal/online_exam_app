import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/home/api/client/subject_api_client.dart';
import 'package:online_exam_app/features/home/data/data_sources/remot_data_sopurce/subject_remote_data_source.dart';
import 'package:online_exam_app/features/home/data/model/subject_dto.dart';
import 'package:online_exam_app/features/home/data/model/subject_responce.dart';



@Injectable(as: SubjectRemoteDataSource)
class SubjectRemoteDataSourceImple implements SubjectRemoteDataSource {
  
 final SubjectApiClient subjectApiClient;
  SubjectRemoteDataSourceImple( this.subjectApiClient);
  @override
  Future<BaseResponse<List<SubjectDto>>> getSubjects() async {
    try {
      SubjectResponce subjectResponce = await subjectApiClient.getSubjects();
      return SuccessResponse<List<SubjectDto>>(subjectResponce.subjects ??[]);
    } on Exception catch (e) {
      return ErrorResponse<List<SubjectDto>>(e);
    }
  }
}
