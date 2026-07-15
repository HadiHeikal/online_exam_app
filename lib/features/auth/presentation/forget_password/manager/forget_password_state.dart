part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

// Request Code (Email screen)
final class RequestCodeLoading extends ForgetPasswordState {}

final class RequestCodeSuccess extends ForgetPasswordState {}

final class RequestCodeError extends ForgetPasswordState {
  final String error;
  RequestCodeError(this.error);
}

// Verify Code (OTP screen)
final class VerifyCodeLoading extends ForgetPasswordState {}

final class VerifyCodeSuccess extends ForgetPasswordState {}

final class VerifyCodeError extends ForgetPasswordState {
  final String error;
  VerifyCodeError(this.error);
}

// Reset Password (New password screen)
final class ResetPasswordLoading extends ForgetPasswordState {}

final class ResetPasswordSuccess extends ForgetPasswordState {}

final class ResetPasswordError extends ForgetPasswordState {
  final String error;
  ResetPasswordError(this.error);
}
