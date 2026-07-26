import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/views/otp_verification_view.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/email_verification_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) => getIt.get<ForgetPasswordCubit>(),
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is RequestCodeSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<ForgetPasswordCubit>(),
                  child: const OtpVerificationView(),
                ),
              ),
            );
          } else if (state is RequestCodeError) {
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
        child: const EmailVerificationWidget(),
      ),
    );
  }
}
