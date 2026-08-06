import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/home/domain/entity/subject_entity.dart';

abstract interface class SubjectRepo {
 Future<BaseResponse<List<SubjectEntity>>> getAllSubjects();
}