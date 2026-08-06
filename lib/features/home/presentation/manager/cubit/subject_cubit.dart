import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';

import 'package:online_exam_app/features/home/domain/entity/subject_entity.dart';
import 'package:online_exam_app/features/home/domain/use_case/get_subjects_use_case.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_events.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_state.dart';

@injectable
class SubjectCubit extends Cubit<SubjectState> {
  final GetSubjectsUseCase _getSubjectsUseCase;
  SubjectCubit(this._getSubjectsUseCase) : super(SubjectState());

  void doEvent(SubjectEvents event) {
    switch (event) {
      case GetSubjectsEvent():
        _getSubjects();
        break;
      case SelectedTabeEvent():
        _selectTab(event.index);
        break;
      case ShowSearchResult():
        _search(event.query??'');
        break;
      case ShowExploreEvent():
        break;
      case ShowResultEvent():
        break;
      case ShowProfileEvent():
        break;
    }
  }

  void _getSubjects() async {
    emit(
      state.copyWith(
        subjectBaseState: state.subjectBaseState?.copyWith(isLoading: true),
      ),
    );
    BaseResponse<List<SubjectEntity>> subjects = await _getSubjectsUseCase
        .call();
    switch (subjects) {
      case SuccessResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjectBaseState: state.subjectBaseState?.copyWith(
              isLoading: false,
              data: subjects.data,
            ),
          ),
        );
        break;

      case ErrorResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjectBaseState: state.subjectBaseState?.copyWith(
              isLoading: false,
              errorMessage: subjects.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  void _getResult() {}
  void _getProfile() {}


  
  void _selectTab(int tabIndex) {
    emit(state.copyWith(tabIndex: tabIndex));
    switch (tabIndex) {
      case 0:
        _getSubjects();
        break;
      case 1:
        _getResult();
        break;
      case 2:
        _getProfile();
        break;
    }
  }

  void _search(String queryText) {
    emit(state.copyWith(queryText: queryText));
  }

}
