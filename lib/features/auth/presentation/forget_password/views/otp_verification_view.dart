import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/views/reset_password_view.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/otp_verification_body_widget.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is VerifyCodeSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<ForgetPasswordCubit>(),
                child: const ResetPasswordView(),
              ),
            ),
          );
        } else if (state is VerifyCodeError) {
          // Error is handled visually in the OTP body widget (red borders + "Invalid code")
          // Optionally show a toast too:
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
      child: const OtpVerificationBodyWidget(),
    );
  }
}
