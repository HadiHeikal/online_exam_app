import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constants/ui_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors_extension.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/otp_input_widget.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/password_flow_app_bar.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/password_flow_subtitle.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/primary_action_button.dart';

class OtpVerificationBodyWidget extends StatelessWidget {
  const OtpVerificationBodyWidget({super.key});

  Widget _buildOtpSection(BuildContext context, ForgetPasswordCubit cubit) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      buildWhen: (previous, current) =>
          current is VerifyCodeError ||
          current is VerifyCodeLoading ||
          current is ForgetPasswordInitial,
      builder: (context, state) {
        final hasError = state is VerifyCodeError;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OtpInputWidget(controller: cubit.otpController, hasError: hasError),
            if (hasError) _buildErrorRow(context),
          ],
        );
      },
    );
  }

  Widget _buildErrorRow(BuildContext context) {
    final colors = context.appColors;
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: colors.error, size: 16),
          const SizedBox(width: 4),
          Text(
            UiStrings.invalidCode,
            style: AppTextStyles.regular12.copyWith(color: colors.error),
          ),
        ],
      ),
    );
  }

  Widget _buildResendRow(BuildContext context, ForgetPasswordCubit cubit) {
    final colors = context.appColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(UiStrings.didntReceiveCode, style: AppTextStyles.regular13),
        InkWell(
          onTap: cubit.requestCode,
          child: Text(
            UiStrings.resend,
            style: AppTextStyles.regular13.copyWith(
              color: colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerifyButton(ForgetPasswordCubit cubit) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        final isLoading = state is VerifyCodeLoading;
        return PrimaryActionButton(
          isLoading: isLoading,
          label: UiStrings.continueButton,
          onPressed: cubit.verifyCode,
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, ForgetPasswordCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Text(UiStrings.emailVerification, style: AppTextStyles.medium20),
        const SizedBox(height: 16),
        PasswordFlowSubtitle(UiStrings.otpSubtitle),
        const SizedBox(height: 32),
        _buildOtpSection(context, cubit),
        const SizedBox(height: 16),
        _buildResendRow(context, cubit),
        const SizedBox(height: 48),
        _buildVerifyButton(cubit),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return Scaffold(
      appBar: const PasswordFlowAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _buildBody(context, cubit),
      ),
    );
  }
}
