import 'package:online_exam_app/core/constants/app_strings.dart';

class AppValidators {
  AppValidators._(); // منع الـ instantiation

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.usernameRequired;
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.firstNameRequired;
    }
    if (!RegExp(r"^[a-zA-Z]{2,30}$").hasMatch(value)) {
      return AppStrings.firstNameLettersOnly;
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.lastNameRequired;
    }
    if (!RegExp(r"^[a-zA-Z]{2,30}$").hasMatch(value)) {
      return AppStrings.lastNameLettersOnly;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emailRequired;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }

    if (!RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
    ).hasMatch(value)) {
      return AppStrings.weakPassword;
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (value != password) {
      return AppStrings.passwordNotMatch;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneRequired;
    }

    if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) {
      return AppStrings.invalidEgyptianPhone;
    }

    return null;
  }
}
