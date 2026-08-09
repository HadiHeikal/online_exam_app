import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/get_exams/presentation/manager/cubit/exams_cubit.dart';
import 'package:online_exam_app/features/get_exams/presentation/manager/cubit/exams_event.dart';
import 'package:online_exam_app/features/get_exams/presentation/manager/cubit/exams_state.dart';
class ErrorCustomWidget extends StatelessWidget {
   final ExamsState state;

  const ErrorCustomWidget({
    super.key, required this.state, 
  });

  @override
  Widget build(BuildContext context) {
    final examCubit = context.read<ExamsCubit>();
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: 16),
            Text(
              AppStrings.error,
              style: AppTextStyles.medium18.copyWith(color: AppColors.error),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                state.examBaseState.errorMessage,
                textAlign: TextAlign.center,
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.gray,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                examCubit.doEvent(
                  GetAllSubjectExams('69d980117c82914570305dc9'),
                );
              },
              child: const Text(AppStrings.retry),
            ),
          ],
        ),
      ),
    );
  }
}
