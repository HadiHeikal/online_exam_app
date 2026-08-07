import 'package:online_exam_app/config/base/base_state.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';

class ExamsState {
  BaseState<List<ExamEntity>>? examBaseState;
  ExamsState({this.examBaseState}) {
    examBaseState = examBaseState ?? BaseState<List<ExamEntity>>(isLoading: true);
  }
  ExamsState copyWith({BaseState<List<ExamEntity>>? examBaseState}) {
    return ExamsState(examBaseState: examBaseState ?? this.examBaseState);
  }
}
