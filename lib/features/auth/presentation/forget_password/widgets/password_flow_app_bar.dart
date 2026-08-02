import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constants/ui_strings.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';

class PasswordFlowAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PasswordFlowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(UiStrings.password, style: AppTextStyles.medium20),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
