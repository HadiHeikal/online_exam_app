import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';

abstract class AppTheme {
  static ThemeData get lightAppTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
      scaffoldBackgroundColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.blue,
          elevation: 0,
          foregroundColor: Colors.white,
          fixedSize: Size(343, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTextStyles.regular16.copyWith(color: AppColors.gray),
        hintStyle: AppTextStyles.regular14.copyWith(color: AppColors.black30),
        contentPadding: const EdgeInsets.all(16),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.error),
        ),
      ),
    );
  }
}
