import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_theme/app_theme.dart';

void main() {
  runApp(const OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Exam App',
      theme: AppTheme.lightAppTheme,
      home: Placeholder(),
    );
  }
}
