import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/utils/app_toast.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/views/otp_verification_view.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/email_verification_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  void _onStateChanged(BuildContext context, ForgetPasswordState state) {
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
      showErrorToast(context, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) => getIt.get<ForgetPasswordCubit>(),
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: _onStateChanged,
        child: const EmailVerificationWidget(),
      ),
    );
  }
}
