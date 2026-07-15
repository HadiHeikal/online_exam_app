import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constants/ui_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/otp_input_widget.dart';

class OtpVerificationBodyWidget extends StatelessWidget {
  const OtpVerificationBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(UiStrings.password, style: AppTextStyles.medium20),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Text(
              UiStrings.emailVerification,
              style: AppTextStyles.medium20,
            ),
            const SizedBox(height: 16),
            Text(
              UiStrings.otpSubtitle,
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.gray,
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              buildWhen: (previous, current) =>
                  current is VerifyCodeError ||
                  current is VerifyCodeLoading ||
                  current is ForgetPasswordInitial,
              builder: (context, state) {
                final hasError = state is VerifyCodeError;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OtpInputWidget(
                      controller: cubit.otpController,
                      hasError: hasError,
                    ),
                    if (hasError) ...[
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: AppColors.error,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            UiStrings.invalidCode,
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.error,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  UiStrings.didntReceiveCode,
                  style: AppTextStyles.regular13,
                ),
                InkWell(
                  onTap: () {
                    cubit.requestCode();
                  },
                  child: Text(
                    UiStrings.resend,
                    style: AppTextStyles.regular13.copyWith(
                      color: AppColors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                bool isLoading = state is VerifyCodeLoading;
                return TextButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          cubit.verifyCode();
                        },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isLoading ? AppColors.black30 : AppColors.blue,
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: AppColors.white,
                        )
                      : Text(
                          UiStrings.continueButton,
                          style: AppTextStyles.medium16.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
