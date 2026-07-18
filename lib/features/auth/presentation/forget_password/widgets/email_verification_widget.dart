import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constants/ui_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/core/widgets/app_text_form_field_widget.dart';
import 'package:online_exam_app/features/auth/presentation/forget_password/manager/forget_password_cubit.dart';

class EmailVerificationWidget extends StatelessWidget {
  const EmailVerificationWidget({super.key});

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
        child: Form(
          key: cubit.emailFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                UiStrings.forgetPassword,
                style: AppTextStyles.medium20,
              ),
              const SizedBox(height: 16),
              Text(
                UiStrings.forgetPasswordSubtitle,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.gray,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextFormField(
                labelText: UiStrings.email,
                hintText: UiStrings.enterYourEmail,
                controller: cubit.emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return UiStrings.emailRequired;
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return UiStrings.emailNotValid;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 48),
              BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                builder: (context, state) {
                  bool isLoading = state is RequestCodeLoading;
                  return TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (cubit.emailFormKey.currentState!.validate()) {
                              cubit.requestCode();
                            }
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
      ),
    );
  }
}
