import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/reset_password_body_widget.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          CherryToast.success(
            toastPosition: Position.bottom,
            animationCurve: Curves.easeInCubic,
            animationDuration: const Duration(milliseconds: 500),
            toastDuration: const Duration(seconds: 2),
            animationType: AnimationType.fromBottom,
            title: Text(
              'Password reset successfully',
              style: TextStyle(color: AppColors.success),
            ),
          ).show(context);

          // Pop back to login screen (remove all forget password screens)
          Navigator.of(context).popUntil(
            (route) => route.isFirst,
          );
        } else if (state is ResetPasswordError) {
          CherryToast.error(
            animationType: AnimationType.fromBottom,
            animationDuration: const Duration(milliseconds: 500),
            toastDuration: const Duration(seconds: 2),
            animationCurve: Curves.easeOutCubic,
            toastPosition: Position.bottom,
            title: Text(
              state.error,
              style: const TextStyle(color: AppColors.error),
            ),
          ).show(context);
        }
      },
      child: const ResetPasswordBodyWidget(),
    );
  }
}
