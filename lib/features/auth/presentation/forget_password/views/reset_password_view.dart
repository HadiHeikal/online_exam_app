import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/app_toast.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/reset_password_body_widget.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  void _onStateChanged(BuildContext context, ForgetPasswordState state) {
    if (state is ResetPasswordSuccess) {
      showSuccessToast(context, 'Password reset successfully');
      // Pop back to login screen (remove all forget password screens).
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else if (state is ResetPasswordError) {
      showErrorToast(context, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: _onStateChanged,
      child: const ResetPasswordBodyWidget(),
    );
  }
}
