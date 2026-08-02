import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color success;
  final Color error;
  final Color gray;
  final Color white;
  final Color black;
  final Color black30;
  final Color blue;
  final Color lightBlue;

  const AppColorsExtension({
    required this.success,
    required this.error,
    required this.gray,
    required this.white,
    required this.black,
    required this.black30,
    required this.blue,
    required this.lightBlue,
  });

  static const light = AppColorsExtension(
    success: AppColors.success,
    error: AppColors.error,
    gray: AppColors.gray,
    white: AppColors.white,
    black: AppColors.black,
    black30: AppColors.black30,
    blue: AppColors.blue,
    lightBlue: AppColors.lightBlue,
  );

  @override
  AppColorsExtension copyWith({
    Color? success,
    Color? error,
    Color? gray,
    Color? white,
    Color? black,
    Color? black30,
    Color? blue,
    Color? lightBlue,
  }) {
    return AppColorsExtension(
      success: success ?? this.success,
      error: error ?? this.error,
      gray: gray ?? this.gray,
      white: white ?? this.white,
      black: black ?? this.black,
      black30: black30 ?? this.black30,
      blue: blue ?? this.blue,
      lightBlue: lightBlue ?? this.lightBlue,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      gray: Color.lerp(gray, other.gray, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      black30: Color.lerp(black30, other.black30, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
    );
  }
}

extension AppColorsContextX on BuildContext {
  AppColorsExtension get appColors => Theme.of(this).extension<AppColorsExtension>()!;
}
