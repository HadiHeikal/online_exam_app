import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_exam_app/config/base/base_state.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/config/utils/auth_validators.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/profile/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/profile/presentation/manager/profile_cubite.dart';
import 'package:online_exam_app/features/profile/presentation/manager/profile_event.dart';
import 'package:online_exam_app/features/profile/presentation/manager/profile_state.dart';
import 'package:online_exam_app/features/profile/presentation/views/change_password.dart';
import 'package:online_exam_app/features/profile/presentation/views/methods/profile_extracrt_methods.dart';

import '../../../../core/themes/app_ text_styles/app_text_styles.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});
  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController _userNameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;

  final ImagePicker _imagePicker = ImagePicker();
  File? _selectedProfilePicture;
  final _formKey = GlobalKey<FormState>();
  bool isUpdating = false;
  late ProfileCubit rofileCubit;

  @override
  void initState() {
    super.initState();
    rofileCubit = getIt<ProfileCubit>();
    _userNameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController(text: '************');
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  /// Pick image from gallery
  Future<void> _pickProfilePicture() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        setState(() {
          _selectedProfilePicture = File(image.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error picking image: $e')));
      }
    }
  }

  /// Validate and update profile
  void _onUpdatePressed() {
    if (_formKey.currentState!.validate()) {
      isUpdating = true;
      rofileCubit.doEvent(
        UpdateProfileEvent(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
        ),
      );
    }
  }

  /// Navigate to Change Password
  void _onChangePasswordPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ChangePasswordView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => rofileCubit..doEvent(const FetchUserProfileEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.transparent,
        ),
        body: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            // Show error if exists
            if (state.errorMessage.isNotEmpty) {
              isUpdating = false;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: AppColors.error,
                ),
              );
            }
            if (state.errorMessage.isEmpty && isUpdating) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(AppStrings.alreadyUpdated),
                  backgroundColor: Colors.green,
                ),
              );
              isUpdating = false;
            }
          },
          child: BlocBuilder<ProfileCubit, BaseState<UserEntity>>(
            builder: (context, state) {
              // Populate fields when data arrives
              if (state.data != null && _firstNameController.text.isEmpty) {
                _userNameController.text = state.data!.username;
                _firstNameController.text = state.data!.firstName;
                _lastNameController.text = state.data!.lastName;
                _emailController.text = state.data!.email;
                _phoneController.text = state.data!.phone;
              }

              // Show loading indicator on init
              if (state.isLoading && state.data == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile Picture Section
                      ProfileExtracrtMethods.buildProfilePictureSection(
                        _selectedProfilePicture,
                        _pickProfilePicture,
                      ),

                      const SizedBox(height: 32),
                      // Username Field (Read-only)
                      ProfileExtracrtMethods.buildTextFormField(
                        controller: _userNameController,
                        label: AppStrings.userName,
                        hint: AppStrings.enterUserName,
                      ),
                      const SizedBox(height: 16),
                      // First Name & Last Name Row
                      Row(
                        children: [
                          Expanded(
                            child: ProfileExtracrtMethods.buildTextFormField(
                              controller: _firstNameController,
                              label: AppStrings.firstName,
                              hint: AppStrings.enterFirstName,
                              validator: AuthValidators.firstName,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ProfileExtracrtMethods.buildTextFormField(
                              controller: _lastNameController,
                              label: AppStrings.lastName,
                              hint: AppStrings.enterLastName,
                              validator: AuthValidators.lastName,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Email Field
                      ProfileExtracrtMethods.buildTextFormField(
                        controller: _emailController,
                        label: AppStrings.email,
                        hint: AppStrings.enterEmail,
                        validator: AuthValidators.email,
                      ),
                      const SizedBox(height: 16),
                      // Password Field (with Change button)
                      ProfileExtracrtMethods.buildPasswordField(
                        controller: _passwordController,
                        label: AppStrings.password,
                        onChangePasswordPressed: () {
                          _onChangePasswordPressed();
                        },
                      ),
                      const SizedBox(height: 16),
                      // Phone Number Field
                      ProfileExtracrtMethods.buildTextFormField(
                        controller: _phoneController,
                        label: AppStrings.phoneNumber,
                        hint: AppStrings.enterPhoneNumber,
                        validator: AuthValidators.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 40),
                      // Update Button
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: state.isLoading ? null : _onUpdatePressed,
                          child: state.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : Text(
                                  AppStrings.update,
                                  style: AppTextStyles.regular16,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
