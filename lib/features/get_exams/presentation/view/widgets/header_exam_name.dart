import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';

class HeaderExamName extends StatelessWidget {
  const HeaderExamName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          const SizedBox(height: 40),
          Text(' Exam Name Base on Id', style: AppTextStyles.medium18),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

