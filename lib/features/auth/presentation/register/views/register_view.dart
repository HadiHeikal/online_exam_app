import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/core/widgets/app_text_form_field_widget.dart';
import 'package:online_exam_app/features/auth/presentation/login/views/login_view.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit registerCubit = getIt.get<RegisterCubit>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => registerCubit,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Icon(Icons.arrow_back_ios),
          ),

          title: Text('Sign Up', style: AppTextStyles.medium20),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  CustomTextFormField(
                    controller: usernameController,
                    hintText: 'Enter your User name',
                    labelText: 'User name',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: firstNameController,
                          labelText: 'First name',
                          hintText: 'Enter your fisrt name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'First name is required';
                            }
                            if (!RegExp(r"^[a-zA-Z]{2,30}$").hasMatch(value)) {
                              return 'first name must contain only letters';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 17),
                      Expanded(
                        child: CustomTextFormField(
                          controller: lastNameController,
                          labelText: 'Last name',
                          hintText: 'Enter your last name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Last name is required';
                            }
                            if (!RegExp(r"^[a-zA-Z]{2,30}$").hasMatch(value)) {
                              return 'Last name must contain only letters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  CustomTextFormField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter your Email',
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
                  ),

                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: passwordController,
                          labelText: 'password',
                          hintText: 'Enter password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }

                            if (!RegExp(
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
                            ).hasMatch(value)) {
                              return 'Password must contain uppercase, lowercase, number and special character';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 17),
                      Expanded(
                        child: CustomTextFormField(
                          controller: confirmPasswordController,
                          labelText: 'Confirm password',
                          hintText: 'Confirm password',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Password is required';
                            }
                            if (value != passwordController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  CustomTextFormField(
                    controller: phoneController,
                    labelText: 'Phone number',
                    hintText: 'Enter your phone number',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      }

                      if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) {
                        return 'Enter a valid Egyptian phone number';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 48),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterErrorState) {
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
                      } else if (state is RegisterSuccessState) {
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginView();
                            },
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      bool isLoading = state is RegisterLoadingState;
                      return TextButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  registerCubit.register(
                                    username: usernameController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    rePassword: confirmPasswordController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                        style: TextButton.styleFrom(
                          backgroundColor: isLoading
                              ? AppColors.black30
                              : AppColors.blue,
                        ),
                        child: isLoading
                            ? Center(
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text('Signup', style: AppTextStyles.regular16),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: AppTextStyles.regular16,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          '  Login',
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
        ),
      ),
    );
  }
}
