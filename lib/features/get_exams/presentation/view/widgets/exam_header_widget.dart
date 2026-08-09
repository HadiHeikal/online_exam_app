import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';

import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';

import '../../../../../core/themes/app_ text_styles/app_text_styles.dart';

class ExamHeader extends StatelessWidget {
  final ExamEntity exam;

  const ExamHeader({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 71,
          width: 60,
          child:  Image.asset(AppStrings.profileImage),

        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.title,
                style: AppTextStyles.semibold20
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                   Text(
                    AppStrings.highLevelWord,
                    style: AppTextStyles.medium16
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 1,
                    height: 18,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${exam.numberOfQuestions} Question",
                    style: AppTextStyles.regular14.copyWith(color: AppColors.gray.withValues(alpha: 0.8 )), 
                  ),
                ],
              ),
            ],
          ),
        ),

        Text(
          "${exam.duration} Minutes",
          style:  AppTextStyles.regular16.copyWith(color: AppColors.blue),
        ),
      ],
    );
  }
}
