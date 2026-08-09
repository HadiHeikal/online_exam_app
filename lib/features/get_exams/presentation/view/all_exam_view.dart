import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/config/routing/routes.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/get_exams/presentation/manager/cubit/exams_cubit.dart';
import 'package:online_exam_app/features/get_exams/presentation/manager/cubit/exams_event.dart';
import 'package:online_exam_app/features/get_exams/presentation/manager/cubit/exams_state.dart';
import 'package:online_exam_app/features/get_exams/presentation/view/widgets/empty_custom_widget.dart';
import 'package:online_exam_app/features/get_exams/presentation/view/widgets/error_custom_widget.dart';
import 'package:online_exam_app/features/get_exams/presentation/view/widgets/exam_card.dart';
import 'package:online_exam_app/features/get_exams/presentation/view/widgets/header_exam_name.dart';
import 'package:online_exam_app/features/get_exams/presentation/view/widgets/loading_indicator.dart';

class AllExamView extends StatelessWidget {
  const AllExamView({super.key});

  @override
  Widget build(BuildContext context) {


    return BlocProvider<ExamsCubit>(
      create: (context) =>
          getIt.get<ExamsCubit>()..doEvent(GetAllSubjectExams('69d980117c82914570305dc9')),
      
      child: Builder(
        builder: (context) {
          var cubitExam = context.read<ExamsCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text('Subject Name Test', style: AppTextStyles.medium20),
            ),
          
            body: BlocBuilder<ExamsCubit, ExamsState>(
              builder: (context, state) {
                return _buildBody(context, state,cubitExam);
              },
            ),
          );
        }
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    ExamsState state,
    ExamsCubit examCubit,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(
        slivers: [
          // Category Header
          HeaderExamName(),

          _buildExamsSliver(context, state, examCubit),
        ],
      ),
    );
  }

  Widget _buildExamsSliver(
    BuildContext context,
    ExamsState state,
    ExamsCubit examCubit,
  ) {
    // Loading State
    if (state.examBaseState.isLoading ) {
      return LoadingCircleIndicator();
    }

    // Error State
    if (state.examBaseState.errorMessage.isNotEmpty) {
      return ErrorCustomWidget(state: state);
    }

    // Success State
    final exams = state.examBaseState.data ?? [];

    if (exams.isEmpty) {
      return EmptyCustomWidget();
    }

    // Display Exams
    return showListExam(exams);
  }

  SliverList showListExam(List<ExamEntity> exams) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final exam = exams[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ExamCard(
            title: exam.title,
            questionsCount: exam.numberOfQuestions,
            durationMinutes: exam.duration,
            fromScore: 1.0,
            toScore: 6.0,
            onTap: () {
              Navigator.pushNamed(context, Routes.examInstructionsView, arguments: exam);
            },
          ),
        );
      }, childCount: exams.length),
    );
  }
}
