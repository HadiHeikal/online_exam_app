import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors_extension.dart';

class PasswordFlowSubtitle extends StatelessWidget {
  final String text;

  const PasswordFlowSubtitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.regular14.copyWith(color: context.appColors.gray),
    );
  }
}
