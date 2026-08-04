import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/auth/domain/entities/params/params/register_params.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_event.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.isLoading,
    required this.formKey,
    required this.registerCubit,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
  });

  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final RegisterCubit registerCubit;
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading
          ? null
          : () {
              if (formKey.currentState!.validate()) {
                registerCubit.doEvent(
                  RegisterEventRegister(
                    registerParams: RegisterParams(
                      username: usernameController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      rePassword: confirmPasswordController.text,
                      phone: phoneController.text,
                    ),
                  ),
                );
              }
            },

      child: isLoading
          ? Center(
              child: const CircularProgressIndicator(color: AppColors.white),
            )
          : Text(AppStrings.signup, style: AppTextStyles.regular16),
    );
  }
}
