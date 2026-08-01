import 'package:flutter/material.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/themes/app_theme/app_theme.dart';
import 'package:online_exam_app/features/auth/presentation/login/views/login_view.dart';

void main() {
  configureDependencies();
  runApp(const OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Exam App',
      theme: AppTheme.lightAppTheme,
      home: LoginView(),
    );
  }
}


/*
BlocProvider<ForgetPasswordCubit>(
        create: (_) => getIt.get<ForgetPasswordCubit>(),
        child: const OtpVerificationView(),
      ),
 */

/*
BlocProvider<ForgetPasswordCubit>(
        create: (_) => getIt.get<ForgetPasswordCubit>(),
        child: const ResetPasswordView(),
      ),
 */