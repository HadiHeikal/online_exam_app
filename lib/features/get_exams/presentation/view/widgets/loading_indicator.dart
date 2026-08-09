import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';

class LoadingCircleIndicator extends StatelessWidget {
  const LoadingCircleIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(AppStrings.loadingExams),
          ],
        ),
      ),
    );
  }
}

