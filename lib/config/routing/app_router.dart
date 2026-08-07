import 'package:flutter/material.dart';
import 'package:online_exam_app/config/routing/routes.dart';
import 'package:online_exam_app/features/auth/presentation/login/views/login_view.dart';
import 'package:online_exam_app/features/auth/presentation/register/views/register_view.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/get_exams/presentation/view/all_exam_view.dart';
import 'package:online_exam_app/features/get_exams/presentation/view/exam_instructions.dart';

class AppRouter {
  MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case '/forgotPassword':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/verifyEmail':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/resetPassword':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/allExams':
        return MaterialPageRoute(builder: (_) => const AllExamView());
      case Routes.examInstructionsView:
      final examEntity = settings.arguments as ExamEntity;
        return MaterialPageRoute(builder: (_) =>  ExamInstructions(examEntity:examEntity ));
      case '/exam':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/examScore':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/results':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/resultDetails':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/editProfile':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/changePassword':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
