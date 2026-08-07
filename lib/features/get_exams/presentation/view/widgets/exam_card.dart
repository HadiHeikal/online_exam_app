import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';

class ExamCard extends StatelessWidget {
  final String title;
  final int questionsCount;
  final int durationMinutes;
  final double fromScore;
  final double toScore;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.title,
    required this.questionsCount,
    required this.durationMinutes,
    required this.fromScore,
    required this.toScore,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1111),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        child: Row(
          children: [
            // Icon
            SizedBox(
              width: 60,
              height: 71,
              
              child: Image.asset('assets/images/profile_images/Profit.png'),
            ),
            const SizedBox(width: 12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.highLevel, style: AppTextStyles.medium16),
                      Text(
                        '$durationMinutes Minutes',
                        style: AppTextStyles.medium16.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Questions Count
                  Text(
                    '$questionsCount Question',
                    style: AppTextStyles.regular12.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Score Range
                  Text(
                    'From: ${fromScore.toStringAsFixed(2)} To: ${toScore.toStringAsFixed(2)}',
                    style: AppTextStyles.regular12.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
