import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/config/base/base_state.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:online_exam_app/features/auth/presentation/login/manager/cubit/login_event.dart';
import 'package:online_exam_app/features/auth/presentation/login/manager/cubit/login_state.dart';

@injectable
class LoginCubit extends Cubit<AuthState> {
  bool _isChecked = false;
  final LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase)
    : super(AuthState(baseAuthState: BaseState<UserEntity>()));

  bool get isChecked => _isChecked;

  void doEvent(LoginEvent event) {
    switch (event) {
      case Authloginevent():
        _login(email: event.email, password: event.password);
      case CheckBox():
        _changeCheckBox();
    }
  }

  void _changeCheckBox() {
    _isChecked = !_isChecked;
    emit(state.copyWith(isBoxChecked: _isChecked));
  }

  Future<void> _login({required String email, required String password}) async {
    emit(
      state.copyWith(
        baseAuthState: state.baseAuthState.copyWith(isLoading: true),
      ),
    );

    BaseResponse<UserEntity> loginEntity = await _loginUseCase.call(
      email: email,
      password: password,
    );
    switch (loginEntity) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            baseAuthState: state.baseAuthState.copyWith(
              isLoading: false,
              data: loginEntity.data,
            ),
          ),
        );
        break;
      case ErrorResponse<UserEntity>():
        emit(
          state.copyWith(
            baseAuthState: state.baseAuthState.copyWith(
              isLoading: false,
              errorMessage: loginEntity.errorMessage,
            ),
          ),
        );
        break;
    }
  }
}
