import 'package:online_exam_app/core/constants/app_strings.dart';

class LoginValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return AppStrings.emailRequired;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return AppStrings.validEmail;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return AppStrings.passwordRequired;
    }
    return null;
  }
}
