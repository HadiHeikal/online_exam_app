import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/message_entity.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/change_password_use_case.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/verify_reset_code_use_case.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final VerifyResetCodeUseCase verifyResetCodeUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

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

  ForgetPasswordCubit(
    this.forgetPasswordUseCase,
    this.verifyResetCodeUseCase,
    this.changePasswordUseCase,
  ) : super(ForgetPasswordInitial());

  Future<void> requestCode() async {
    _email = emailController.text.trim();
    emit(RequestCodeLoading());

    BaseResponse<MessageEntity> result = await forgetPasswordUseCase.call(
      email: _email,
    );
    switch (result) {
      case SuccessResponse<MessageEntity>():
        emit(RequestCodeSuccess());
        break;
      case ErrorResponse<MessageEntity>():
        emit(RequestCodeError(result.errorMessage));
        break;
    }
  }

  Future<void> verifyCode() async {
    emit(VerifyCodeLoading());

    BaseResponse<MessageEntity> result = await verifyResetCodeUseCase.call(
      resetCode: otpController.text.trim(),
    );
    switch (result) {
      case SuccessResponse<MessageEntity>():
        emit(VerifyCodeSuccess());
        break;
      case ErrorResponse<MessageEntity>():
        emit(VerifyCodeError(result.errorMessage));
        break;
    }
  }

  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());

    BaseResponse<MessageEntity> result = await changePasswordUseCase.call(
      email: _email,
      newPassword: newPasswordController.text.trim(),
    );
    switch (result) {
      case SuccessResponse<MessageEntity>():
        emit(ResetPasswordSuccess());
        break;
      case ErrorResponse<MessageEntity>():
        emit(ResetPasswordError(result.errorMessage));
        break;
    }
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
