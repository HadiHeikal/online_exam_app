import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/features/auth/presentation/login/manager/cubit/login_cubit.dart';

import 'package:online_exam_app/features/auth/presentation/login/widgets/login_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt.get<LoginCubit>(),
      child: LoginWidget(),
      //Try from alfy
      //secound time
    );
  }
}
