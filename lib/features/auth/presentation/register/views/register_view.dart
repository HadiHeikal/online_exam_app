import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';

import 'package:online_exam_app/features/auth/presentation/register/manager/register_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/register/widgets/register_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => getIt.get<RegisterCubit>(),
      child: RegisterWidget(),
      //try
    );
  }
}
