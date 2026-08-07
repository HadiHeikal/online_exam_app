import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base/base_state.dart';
import 'package:online_exam_app/features/home/domain/entity/subject_entity.dart';

class SubjectState extends Equatable {
  final List<SubjectEntity> filtredList;
  final String queryText;
  final BaseState<List<SubjectEntity>> subjectBaseState;
  const SubjectState({
    this.filtredList = const [],
    this.subjectBaseState = const BaseState<List<SubjectEntity>>(),
    this.queryText = '',
  });

  SubjectState copyWith({
    List<SubjectEntity>? filtredList,
    String? queryText,
    BaseState<List<SubjectEntity>>? subjectBaseState,
  }) {
    return SubjectState(
      filtredList: filtredList ?? this.filtredList,
      queryText: queryText ?? this.queryText,
      subjectBaseState: subjectBaseState ?? this.subjectBaseState,
    );
  }

  @override
  List<Object?> get props => [queryText, filtredList, subjectBaseState];
}
