import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';

import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_cubit.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_events.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_state.dart';
import 'package:online_exam_app/features/home/presentation/view/widgets/custom_search_bar.dart';
import 'package:online_exam_app/features/home/presentation/view/widgets/custom_subject_card.dart';

import '../../../../../core/themes/app_ text_styles/app_text_styles.dart';

class BodySubjectView extends StatelessWidget {
  const BodySubjectView({super.key});

 

  @override
  Widget build(BuildContext context) {
    SubjectCubit subjectCubit = context.read<SubjectCubit>();
    return CustomScrollView(
      slivers: [
        // Header Section
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.survey,
                  style: AppTextStyles.medium20.copyWith(color: AppColors.blue),
                ),
                const SizedBox(height: 16),
                CustomSearchBar(),
                const SizedBox(height: 24),
                Text(
                  AppStrings.browseBySubject,
                  style: AppTextStyles.medium18.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),

        // Subjects List with BlocBuilder
        BlocBuilder<SubjectCubit, SubjectState>(
          builder: (context, state) {
            // Loading State
            if (state.subjectBaseState.isLoading) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(AppStrings.loadingSubjects),
                    ],
                  ),
                ),
              );
            }

            // Error State
            if (state.subjectBaseState.errorMessage.isNotEmpty ) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppStrings.error,
                        style: AppTextStyles.medium16.copyWith(color: Colors.red),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          state.subjectBaseState.errorMessage ,
                          textAlign: TextAlign.center,

                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.gray.withValues(alpha: 0.8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          subjectCubit.doEvent(GetSubjectsEvent());
                        },
                        child: const Text(AppStrings.retry),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Success State
            // final subjects = state.subjectBaseState?.data ?? [];
            final filtredSubjectList = state.filtredList;

            if (filtredSubjectList.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 64,
                        color: Colors.blue[300],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.queryText.isNotEmpty?"${AppStrings.noSubjectsAvailable} ${state.queryText}":
                        AppStrings.noSubjectsAvailable,
                        style: AppTextStyles.medium16.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Display Subjects
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final subject = filtredSubjectList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: CustomSubjectCard(
                    name: subject.name,
                    imageUrl: subject.icon,
                    onTap: () {
                      // Navigate to subject details
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${AppStrings.tappedOn}${subject.name}',
                          ),
                        ),
                      );
                    },
                  ),
                );
              }, childCount: filtredSubjectList.length),
            );
          },
        ),

        // // Bottom Spacing
        // SliverToBoxAdapter(
        //   child: Container(height: 30),
        // ),
      ],
    );
  }
}
