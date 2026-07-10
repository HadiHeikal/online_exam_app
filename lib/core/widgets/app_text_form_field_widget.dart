import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller ;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
        hintStyle: AppTextStyles.regular14,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}