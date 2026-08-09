import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/config/utils/auth_validators.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/profile/presentation/manager/profile_cubite.dart';
import 'package:online_exam_app/features/profile/presentation/manager/profile_event.dart';
import 'package:online_exam_app/features/profile/presentation/manager/profile_state.dart';
import 'package:online_exam_app/features/profile/presentation/views/methods/profile_extracrt_methods.dart';

import '../../../../core/themes/app_ text_styles/app_text_styles.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isUpdatingPassword = false;
  late ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _profileCubit = getIt<ProfileCubit>();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _profileCubit,

      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: AppColors.error,
              ),
            );
          } else if (state.passwordData != null) {
          
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(AppStrings.alreadyUpdated),
                backgroundColor: AppColors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title:  Text(AppStrings.changePassword)),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    ProfileExtracrtMethods.buildTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.currentPasswordrequired;
                        }
                        return null;
                      },
                      controller: _currentPasswordController,
                      label: AppStrings.currentPassword,
                      hint: AppStrings.currentPassword,
                    ),
                    const SizedBox(height: 24),
                    ProfileExtracrtMethods.buildTextFormField(
                      validator: (value) {
                        return AuthValidators.strongPassword(value);
                      },
                      controller: _newPasswordController,
                      label: AppStrings.newPassword,
                      hint: AppStrings.newPassword
                    ),
                    const SizedBox(height: 24),
                    ProfileExtracrtMethods.buildTextFormField(
                      validator: (value) {
                        return AuthValidators.confirmPassword(
                          value,
                          _newPasswordController.text,
                        );
                      },
                      controller: _confirmPasswordController,
                      label: AppStrings.confirmPassword,
                      hint: AppStrings.confirmPassword,
                    ),
                    const SizedBox(height: 54),
                    TextButton(
                      onPressed: state.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                isUpdatingPassword = true;
                                _profileCubit.doEvent(
                                  ChangePasswordEvent(
                                    currentPassword:
                                        _currentPasswordController.text,
                                    newPassword: _newPasswordController.text,
                                    confirmPassword:
                                        _confirmPasswordController.text,
                                  ),
                                );
                              }
                            },
                      child: state.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              AppStrings.update,
                              style: AppTextStyles.medium16,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
