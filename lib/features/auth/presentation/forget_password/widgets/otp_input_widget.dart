import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors_extension.dart';

class OtpInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool hasError;

  const OtpInputWidget({
    super.key,
    required this.controller,
    this.hasError = false,
  });

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  static const int _otpLength = 6;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_otpLength, (_) => TextEditingController());
    _focusNodes = List.generate(_otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _updateMainController() {
    widget.controller.text = _controllers.map((c) => c.text).join();
  }

  void _onDigitChanged(String value, int index) {
    _updateMainController();
    if (value.isNotEmpty && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  OutlineInputBorder _border({required bool focused}) {
    final colors = context.appColors;
    final BorderSide side;
    if (widget.hasError) {
      side = BorderSide(color: colors.error, width: 1.5);
    } else if (focused) {
      side = BorderSide(color: colors.blue, width: 1.5);
    } else {
      side = BorderSide.none;
    }
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: side,
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      counterText: '',
      filled: true,
      fillColor: context.appColors.lightBlue,
      contentPadding: EdgeInsets.zero,
      border: _border(focused: false),
      enabledBorder: _border(focused: false),
      focusedBorder: _border(focused: true),
    );
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 48,
      height: 48,
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: AppTextStyles.medium20.copyWith(color: context.appColors.black),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: _decoration(),
        onChanged: (value) => _onDigitChanged(value, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_otpLength, _buildOtpBox),
    );
  }
}
