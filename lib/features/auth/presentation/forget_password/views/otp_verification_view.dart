import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/app_toast.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/views/reset_password_view.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/otp_verification_body_widget.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  void _onStateChanged(BuildContext context, ForgetPasswordState state) {
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
      // Error is also handled visually in the OTP body widget (red borders + "Invalid code").
      showErrorToast(context, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: _onStateChanged,
      child: const OtpVerificationBodyWidget(),
    );
  }
}
