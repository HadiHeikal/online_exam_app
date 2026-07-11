import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(RegisterInitialState());

  void register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    BaseResponse<UserEntity> myRegisterEntity = await registerUseCase.call(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );

    switch (myRegisterEntity) {
      case SuccessResponse():
        log(myRegisterEntity.data.toString());
        emit(RegisterSuccessState(myRegisterEntity.data));
        break;
      case ErrorResponse():
        log(myRegisterEntity.errorMessage);
        emit(RegisterErrorState(myRegisterEntity.errorMessage));
        break;
    }
  }
}
