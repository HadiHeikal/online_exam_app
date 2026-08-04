import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/params/params/register_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_event.dart';
import 'package:online_exam_app/features/auth/presentation/register/manager/register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  RegisterCubit(this._registerUseCase) : super(RegisterInitialState());

  void doEvent(RegisterEvent event) {
    switch (event) {
      case RegisterEventRegister():
        _register(event.registerParams);
    }
  }

  void _register(RegisterParams registerParams) async {
    emit(RegisterLoadingState());
    BaseResponse<UserEntity> _myRegisterEntity = await _registerUseCase.call(
      registerParams,
    );

    switch (_myRegisterEntity) {
      case SuccessResponse():
        log(_myRegisterEntity.data.toString());
        emit(RegisterSuccessState(_myRegisterEntity.data));
        break;
      case ErrorResponse():
        log(_myRegisterEntity.errorMessage);
        emit(RegisterErrorState(_myRegisterEntity.errorMessage));
        break;
    }
  }
}
