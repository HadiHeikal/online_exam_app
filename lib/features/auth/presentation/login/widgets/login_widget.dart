import 'dart:developer';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/auth/presentation/login/manager/cubit/login_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/login/manager/cubit/login_event.dart';
import 'package:online_exam_app/features/auth/presentation/login/manager/cubit/login_state.dart';
import 'package:online_exam_app/features/auth/presentation/login/widgets/custom_text_form_field.dart';

class LoginWidget extends StatelessWidget {
   LoginWidget({super.key});
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();

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
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                obscureText: false,
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
                controller:emailController,
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                obscureText: true,
                labelText: 'Password',
                hintText: 'Enter your password',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'password is required';
                  }
                  return null;
                },
                controller: passwordController,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BlocBuilder<LoginCubit, AuthState>(
                        builder: (context, state) {
                          return Checkbox(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.gray),
                            ),

                            value: loginCubit.isChecked,
                            onChanged: (value) {
                             loginCubit.doEvent(CheckBox(isChecked:  loginCubit.isChecked));
                              // loginCubit.changeCheckBox(value!);
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
              BlocConsumer<LoginCubit, AuthState>(
                listener: (context, state) {
                  if (state.baseAuthState.data != null) {
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
                    log(state.baseAuthState.data!.email.toString());
                  } else if (state.baseAuthState.errorMesage.isNotEmpty) {
                    CherryToast.error(
                      animationType: AnimationType.fromBottom,
                      animationDuration: const Duration(milliseconds: 500),
                      toastDuration: const Duration(seconds: 2),
                      animationCurve: Curves.easeOutCubic,
                      toastPosition: Position.bottom,
                      title: Text(
                        state.baseAuthState.errorMesage,
                        style: TextStyle(color: AppColors.error),
                      ),
                    ).show(context);
                  }
                },
                builder: (context, state) {
                  bool isLoading = state.baseAuthState.isLoading;
                  return TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              loginCubit.doEvent(
                                Authloginevent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
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
