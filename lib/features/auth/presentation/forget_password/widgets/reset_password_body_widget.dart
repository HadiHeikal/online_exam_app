import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constants/ui_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/widgets/app_text_form_field_widget.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/password_flow_app_bar.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/password_flow_subtitle.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/primary_action_button.dart';

class ResetPasswordBodyWidget extends StatelessWidget {
  const ResetPasswordBodyWidget({super.key});

  String? _validateNewPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return UiStrings.passwordRequired;
    }
    if (value.length < 6) {
      return UiStrings.passwordTooShort;
    }
    return null;
  }

  String? _validateConfirmPassword(String? value, ForgetPasswordCubit cubit) {
    if (value == null || value.trim().isEmpty) {
      return UiStrings.passwordRequired;
    }
    if (value != cubit.newPasswordController.text) {
      return UiStrings.passwordsDoNotMatch;
    }
    return null;
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Text(UiStrings.resetPassword, style: AppTextStyles.medium20),
        const SizedBox(height: 16),
        PasswordFlowSubtitle(UiStrings.resetPasswordSubtitle),
      ],
    );
  }

  Widget _buildNewPasswordField(ForgetPasswordCubit cubit) {
    return CustomTextFormField(
      labelText: UiStrings.newPassword,
      hintText: UiStrings.enterYourPassword,
      controller: cubit.newPasswordController,
      validator: _validateNewPassword,
    );
  }

  Widget _buildConfirmPasswordField(ForgetPasswordCubit cubit) {
    return CustomTextFormField(
      labelText: UiStrings.confirmPassword,
      hintText: UiStrings.confirmPasswordHint,
      controller: cubit.confirmPasswordController,
      validator: (value) => _validateConfirmPassword(value, cubit),
    );
  }

  Widget _buildSubmitButton(ForgetPasswordCubit cubit) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        final isLoading = state is ResetPasswordLoading;
        return PrimaryActionButton(
          isLoading: isLoading,
          label: UiStrings.continueButton,
          onPressed: () {
            if (cubit.resetPasswordFormKey.currentState!.validate()) {
              cubit.resetPassword();
            }
          },
        );
      },
    );
  }

  Widget _buildForm(ForgetPasswordCubit cubit) {
    return Form(
      key: cubit.resetPasswordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          const SizedBox(height: 32),
          _buildNewPasswordField(cubit),
          const SizedBox(height: 24),
          _buildConfirmPasswordField(cubit),
          const SizedBox(height: 48),
          _buildSubmitButton(cubit),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return Scaffold(
      appBar: const PasswordFlowAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _buildForm(cubit),
      ),
    );
  }
}
