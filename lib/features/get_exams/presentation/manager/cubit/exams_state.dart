import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base/base_state.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';

class ExamsState extends Equatable {
final  BaseState<List<ExamEntity>> examBaseState;
const  ExamsState({this.examBaseState = const BaseState<List<ExamEntity>>()}); 
  ExamsState copyWith({BaseState<List<ExamEntity>>? examBaseState}) {
    return ExamsState(examBaseState: examBaseState ?? this.examBaseState);
  }

  @override

  List<Object?> get props => [
    examBaseState,

  ];
}
