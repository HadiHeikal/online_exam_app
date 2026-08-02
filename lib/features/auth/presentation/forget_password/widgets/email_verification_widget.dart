import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constants/ui_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/widgets/app_text_form_field_widget.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/password_flow_app_bar.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/password_flow_subtitle.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/widgets/primary_action_button.dart';

class EmailVerificationWidget extends StatelessWidget {
  const EmailVerificationWidget({super.key});

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return UiStrings.emailRequired;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return UiStrings.emailNotValid;
    }
    return null;
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Text(UiStrings.forgetPassword, style: AppTextStyles.medium20),
        const SizedBox(height: 16),
        PasswordFlowSubtitle(UiStrings.forgetPasswordSubtitle),
      ],
    );
  }

  Widget _buildEmailField(ForgetPasswordCubit cubit) {
    return CustomTextFormField(
      labelText: UiStrings.email,
      hintText: UiStrings.enterYourEmail,
      controller: cubit.emailController,
      validator: _validateEmail,
    );
  }

  Widget _buildSubmitButton(BuildContext context, ForgetPasswordCubit cubit) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        final isLoading = state is RequestCodeLoading;
        return PrimaryActionButton(
          isLoading: isLoading,
          label: UiStrings.continueButton,
          onPressed: () {
            if (cubit.emailFormKey.currentState!.validate()) {
              cubit.requestCode();
            }
          },
        );
      },
    );
  }

  Widget _buildForm(BuildContext context, ForgetPasswordCubit cubit) {
    return Form(
      key: cubit.emailFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          const SizedBox(height: 32),
          _buildEmailField(cubit),
          const SizedBox(height: 48),
          _buildSubmitButton(context, cubit),
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
        child: _buildForm(context, cubit),
      ),
    );
  }
}
