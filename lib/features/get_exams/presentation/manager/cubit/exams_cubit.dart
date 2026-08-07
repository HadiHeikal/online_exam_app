import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/get_exams/domain/use_cases/get_exams_use_case.dart';
import 'package:online_exam_app/features/get_exams/presentation/manager/cubit/exams_event.dart';
import 'package:online_exam_app/features/get_exams/presentation/manager/cubit/exams_state.dart';

@singleton
class ExamsCubit extends Cubit<ExamsState> {
  final GetExamsUseCase _getExamsUseCase;
  ExamsCubit(this._getExamsUseCase) : super(ExamsState());


  void doEvent(ExamsEvent event){
    switch (event){
      case GetAllSubjectExams():
        _getExams(subjectId: event.subjectId);
        break;
    }

  }

  void _getExams({required String subjectId}) async {
    emit(
      state.copyWith(
        examBaseState: state.examBaseState?.copyWith(isLoading: true),
      ),
    );
    BaseResponse<List<ExamEntity>> examEntityList = await _getExamsUseCase.call(
      subjectId: subjectId,
    );
    switch (examEntityList) {
      case SuccessResponse<List<ExamEntity>>():
        emit(
          state.copyWith(
            examBaseState: state.examBaseState?.copyWith(
              data: examEntityList.data,
              isLoading: false,
            ),
          ),
        );
        break;
      case ErrorResponse<List<ExamEntity>>():
        emit(
          state.copyWith(
            examBaseState: state.examBaseState?.copyWith(
              errorMessage: examEntityList.errorMessage,
              isLoading: false,
            ),
          ),
        );
        break;
    }
  }
}
