import 'dart:io';

import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';

import '../../../../../core/themes/app_ text_styles/app_text_styles.dart';

abstract class ProfileExtracrtMethods {
  /// Build Profile Picture Section with edit button
  static Widget buildProfilePictureSection(
    File? selectedProfilePicture,
    VoidCallback pickProfilePicture,
  ) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: AppColors.lightBlue,
          backgroundImage: selectedProfilePicture != null
              ? FileImage(selectedProfilePicture)
              : null,
          child: selectedProfilePicture == null
              ? Icon(Icons.person, size: 70, color: AppColors.blue)
              : null,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.blue,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: pickProfilePicture,
            child: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  /// Build Text Form Field with label
  static Widget buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    bool enabled = true,
  }) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      decoration: InputDecoration(hintText: hint, labelText: label),
      validator: validator,
      keyboardType: keyboardType,
      enabled: enabled,
    );
  }

  static Widget buildPasswordField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    bool enabled = false,
    required void Function() onChangePasswordPressed,
  }) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      readOnly: true,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        labelText: AppStrings.password,
        suffix: InkWell(
          onTap: onChangePasswordPressed,
          child: Text(
            AppStrings.change,
            style: AppTextStyles.medium16.copyWith(color: AppColors.blue),
          ),
        ),
      ),
    );
  }

  
}
