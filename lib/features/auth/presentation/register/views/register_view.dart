import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/widgets/app_text_form_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    return Scaffold(
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
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          }
                          if (!RegExp(r'^.{6,}$').hasMatch(value)) {
                            return 'Password must be at least 6 characters';
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

                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      log('ok signup');
                    }
                  },
                  child: Text('Signup', style: AppTextStyles.regular16),
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
    );
  }
}
