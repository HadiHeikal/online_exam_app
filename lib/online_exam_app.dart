// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:online_exam_app/config/routing/app_router.dart';
import 'package:online_exam_app/core/themes/app_theme/app_theme.dart';
import 'package:online_exam_app/features/auth/presentation/login/views/login_view.dart';

class OnlineExamApp extends StatelessWidget {
  final AppRouter appRouter;
  const OnlineExamApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Exam App',
      debugShowCheckedModeBanner: false,
      // theming
      theme: AppTheme.lightAppTheme,
      onGenerateRoute: appRouter.generateRoutes,
      home: const LoginView(),
    );
  }
}
