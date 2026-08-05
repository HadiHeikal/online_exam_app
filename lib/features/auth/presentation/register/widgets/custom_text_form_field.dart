import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller ;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.controller, required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        
        border: const OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,

        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}