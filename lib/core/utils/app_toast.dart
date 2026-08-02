import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors_extension.dart';

void showErrorToast(BuildContext context, String message) {
  CherryToast.error(
    animationType: AnimationType.fromBottom,
    animationDuration: const Duration(milliseconds: 500),
    toastDuration: const Duration(seconds: 2),
    animationCurve: Curves.easeOutCubic,
    toastPosition: Position.bottom,
    title: Text(message, style: TextStyle(color: context.appColors.error)),
  ).show(context);
}

void showSuccessToast(BuildContext context, String message) {
  CherryToast.success(
    animationType: AnimationType.fromBottom,
    animationDuration: const Duration(milliseconds: 500),
    toastDuration: const Duration(seconds: 2),
    animationCurve: Curves.easeInCubic,
    toastPosition: Position.bottom,
    title: Text(message, style: TextStyle(color: context.appColors.success)),
  ).show(context);
}
