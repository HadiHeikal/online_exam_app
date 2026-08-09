import 'package:flutter/material.dart';

import '../../../../../core/themes/app_ text_styles/app_text_styles.dart';


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

