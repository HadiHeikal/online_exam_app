import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/config/utils/auth_validators.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_state.dart';
import 'package:online_exam_app/features/auth/presentation/register/widgets/custom_text_button.dart';
import 'package:online_exam_app/features/auth/presentation/register/widgets/custom_text_form_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.registerCubit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final RegisterCubit registerCubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                obscureText: false,
                controller: usernameController,
                hintText: AppStrings.enterUserName,
                labelText: AppStrings.userName,
                validator: (value) {
                  return AuthValidators.username(value);
                },
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      obscureText: false,
                      controller: firstNameController,
                      labelText: AppStrings.firstName,
                      hintText: AppStrings.enterFirstName,
                      validator: (value) {
                        return AuthValidators.firstName(value);
                      },
                    ),
                  ),
                  SizedBox(width: 17),
                  Expanded(
                    child: CustomTextFormField(
                      obscureText: false,
                      controller: lastNameController,
                      labelText: AppStrings.lastName,
                      hintText: AppStrings.enterLastName,
                      validator: (value) {
                        return AuthValidators.lastName(value);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                obscureText: false,
                controller: emailController,
                labelText: AppStrings.email,
                hintText: AppStrings.enterEmail,
                validator: (value) {
                  return AuthValidators.email(value);
                },
              ),

              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      obscureText: true,
                      controller: passwordController,
                      labelText: AppStrings.password,
                      hintText: AppStrings.enterPassword,
                      validator: (value) {
                        return AuthValidators.strongPassword(value);
                      },
                    ),
                  ),
                  SizedBox(width: 17),
                  Expanded(
                    child: CustomTextFormField(
                      obscureText: true,

                      controller: confirmPasswordController,
                      labelText: AppStrings.confirmPassword,
                      hintText: AppStrings.confirmPassword,
                      validator: (value) {
                        return AuthValidators.confirmPassword(
                          value,
                          passwordController.text,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                obscureText: false,
                controller: phoneController,
                labelText: AppStrings.phoneNumber,
                hintText: AppStrings.enterPhoneNumber,
                validator: (value) {
                  return AuthValidators.phone(value);
                },
              ),
              SizedBox(height: 48),
              BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  switch (state) {
                    case RegisterLoadingState():
                    case RegisterInitialState():
                      break;
                    case RegisterErrorState():
                      CherryToast.error(
                        animationType: AnimationType.fromBottom,
                        animationDuration: const Duration(milliseconds: 500),
                        toastDuration: const Duration(seconds: 2),
                        animationCurve: Curves.easeOutCubic,
                        toastPosition: Position.bottom,
                        title: Text(
                          state.error,
                          style: TextStyle(color: AppColors.error),
                        ),
                      ).show(context);
                      break;
                    case RegisterSuccessState():
                      CherryToast.success(
                        toastPosition: Position.bottom,
                        animationCurve: Curves.easeInCubic,
                        animationDuration: const Duration(milliseconds: 500),
                        toastDuration: const Duration(seconds: 2),
                        animationType: AnimationType.fromBottom,
                        title: Text(
                          AppStrings.accountCreatedSuccessfully,
                          style: TextStyle(color: AppColors.success),
                        ),
                      ).show(context);
                      Navigator.pop(context);
                      break;
                  }
                },
                builder: (context, state) {
                  bool isLoading = state is RegisterLoadingState;
                  return CustomTextButton(
                    isLoading: isLoading,
                    formKey: formKey,
                    registerCubit: registerCubit,
                    usernameController: usernameController,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    phoneController: phoneController,
                  );
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAccount,
                    style: AppTextStyles.regular16,
                  ),
                  SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.login,
                      style: AppTextStyles.regular16.copyWith(
                        color: AppColors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
