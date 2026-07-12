import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/core/widgets/app_text_form_field_widget.dart';
import 'package:online_exam_app/features/auth/presentation/login/manager/cubit/login_cubit.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: AppTextStyles.medium20),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: loginCubit.formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'Email',
                hintText: 'Enter your email',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                controller: loginCubit.emailController,
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'Password',
                hintText: 'Enter your password',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'password is required';
                  }
                  return null;
                },
                controller: loginCubit.passwordController,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return Checkbox(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.gray),
                            ),

                            value: loginCubit.isChecked,
                            onChanged: (value) {
                              loginCubit.changeCheckBox(value!);
                            },
                          );
                        },
                      ),
                      Text('Remember me', style: AppTextStyles.regular13),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      //but here the navigator to forget password;
                    },
                    child: Text(
                      'Forget password?',
                      style: AppTextStyles.regular13.copyWith(
                        decoration: TextDecoration.underline,
                        // decorationStyle: TextDecorationStyle.wavy
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessSate) {
                    CherryToast.success(
                      toastPosition: Position.bottom,
                      animationCurve: Curves.easeInCubic,
                      animationDuration: const Duration(milliseconds: 500),
                      toastDuration: const Duration(seconds: 2),
                      animationType: AnimationType.fromBottom,
                      title: Text(
                        "Account created successfully",
                        style: TextStyle(color: AppColors.success),
                      ),
                    ).show(context);
                    log(state.authEntity.createdAt.toString());
                  } else if (state is LoginErrorSate) {
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
                  }
                },
                builder: (context, state) {
                  bool isLoading = state is LoginLoadingSate;
                  return TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (loginCubit.formKey.currentState!.validate()) {
                              loginCubit.login(
                                email: loginCubit.emailController.text,
                                password: loginCubit.passwordController.text,
                              );
                            }
                          },
                    style: TextButton.styleFrom(
                      backgroundColor: isLoading
                          ? AppColors.black30
                          : AppColors.blue,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.white,
                          )
                        : Text(
                            'Login',
                            style: AppTextStyles.medium16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                  );
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?  ',
                    style: AppTextStyles.regular16,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'SignUp',
                      style: AppTextStyles.regular16.copyWith(
                        color: Colors.blue,
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
