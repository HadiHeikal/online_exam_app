import 'package:flutter/material.dart';
import 'package:online_exam_app/config/routing/routes.dart';
import 'package:online_exam_app/features/auth/presentation/login/views/login_view.dart';
import 'package:online_exam_app/features/auth/presentation/register/views/register_view.dart';
import 'package:online_exam_app/features/home/presentation/view/home_view.dart';

class AppRouter {
  MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case '/forgotPassword':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/verifyEmail':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/resetPassword':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/allExams':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case '/examInstructions':
        return MaterialPageRoute(builder: (_) => const Placeholder());
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
