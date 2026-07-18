import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();

  // Form keys
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  // Store email for the reset password step
  String _email = '';
  String get email => _email;

  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> requestCode() async {
    _email = emailController.text.trim();
    emit(RequestCodeLoading());

    // TODO: Replace with actual use case call
    await Future.delayed(const Duration(seconds: 1));
    emit(RequestCodeSuccess());
  }

  Future<void> verifyCode() async {
    emit(VerifyCodeLoading());

    // TODO: Replace with actual use case call
    await Future.delayed(const Duration(seconds: 1));
    emit(VerifyCodeSuccess());
  }

  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());

    // TODO: Replace with actual use case call
    await Future.delayed(const Duration(seconds: 1));
    emit(ResetPasswordSuccess());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    return super.close();
  }
}
