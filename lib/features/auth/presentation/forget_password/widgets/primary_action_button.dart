import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors_extension.dart';

class PrimaryActionButton extends StatelessWidget {
  final bool isLoading;
  final String label;
  final VoidCallback onPressed;

  const PrimaryActionButton({
    super.key,
    required this.isLoading,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        backgroundColor: isLoading ? colors.black30 : colors.blue,
      ),
      child: isLoading
          ? CircularProgressIndicator(color: colors.white)
          : Text(
              label,
              style: AppTextStyles.medium16.copyWith(color: colors.white),
            ),
    );
  }
}
