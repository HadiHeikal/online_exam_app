import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/register/widgets/register_view_body.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = context.read<RegisterCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Icon(Icons.arrow_back_ios),
        ),

        title: Text(AppStrings.signUp, style: AppTextStyles.medium20),
      ),
      body: RegisterViewBody(
        formKey: formKey,
        usernameController: usernameController,
        firstNameController: firstNameController,
        lastNameController: lastNameController,
        emailController: emailController,
        passwordController: passwordController,
        confirmPasswordController: confirmPasswordController,
        phoneController: phoneController,
        registerCubit: registerCubit,
      ),
    );
  }
}
