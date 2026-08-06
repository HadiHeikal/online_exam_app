import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/exam/data/data_source/remote/exam_remote_data_source.dart';
import 'package:online_exam_app/features/exam/data/models/get_all_questions_on_exam_model.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/exam/domain/repo/exam_repo.dart';

@LazySingleton(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource examRemoteDataSource;
  ExamRepoImpl(this.examRemoteDataSource);

  @override
  Future<BaseResponse<ExamEntity>> getExamById(String examId) async {
    BaseResponse<GetAllQuestionsOnExamModel> getAllQuestionsOnExamModel =
        await examRemoteDataSource.getExamQuestions(examId);
    switch (getAllQuestionsOnExamModel) {
      case SuccessResponse<GetAllQuestionsOnExamModel>():
        ExamEntity examEntity = getAllQuestionsOnExamModel.data.toEntity();
        return SuccessResponse<ExamEntity>(examEntity);
      case ErrorResponse<GetAllQuestionsOnExamModel>():
        return ErrorResponse<ExamEntity>(getAllQuestionsOnExamModel.error);
    }
  }
}
