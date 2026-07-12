import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';

import 'package:online_exam_app/features/auth/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitialSate());

  void changeCheckBox(bool value) {
    isChecked = value;
    emit(CheckBoxState());
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingSate());

    BaseResponse<AuthEntity> loginEntity = await loginUseCase.call(
      email: email,
      password: password,
    );
    switch (loginEntity) {
      case SuccessResponse<AuthEntity>():
        emit(LoginSuccessSate(loginEntity.data));
        break;
      case ErrorResponse<AuthEntity>():
        emit(LoginErrorSate(loginEntity.errorMessage));
        break;
    }
  }
}
