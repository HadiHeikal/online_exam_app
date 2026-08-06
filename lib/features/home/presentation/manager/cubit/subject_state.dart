import 'package:online_exam_app/config/base/base_state.dart';
import 'package:online_exam_app/features/home/domain/entity/subject_entity.dart';

class SubjectState {
  int tabIndex;
  String queryText;
  BaseState<List<SubjectEntity>>? subjectBaseState;

  SubjectState({
    this.subjectBaseState,
    this.tabIndex = 0,
    this.queryText = '',
  }) {
    subjectBaseState =
        subjectBaseState ?? BaseState<List<SubjectEntity>>(isLoading: true);
  }

  SubjectState copyWith({
    String? queryText,
    int? tabIndex,
    BaseState<List<SubjectEntity>>? subjectBaseState,
  }) {
    return SubjectState(
      queryText: queryText ?? this.queryText,
      tabIndex: tabIndex ?? this.tabIndex,
      subjectBaseState: subjectBaseState ?? this.subjectBaseState,
    );
  }

  List<SubjectEntity> getFilteredSubjects() {
    List<SubjectEntity> listSubject = subjectBaseState?.data ?? [];
    if (queryText.isNotEmpty) {
      List<SubjectEntity> filtredSubject = listSubject.where((element) {
        return element.name.toLowerCase().contains(queryText.toLowerCase());
      }).toList();
      return filtredSubject;
    }else {
      return listSubject;
    }
  }
}
