// ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'login_cubit.dart';

// sealed class LoginState {}

// final class LoginInitialSate extends LoginState {}

// final class LoginLoadingSate extends LoginState {}
// final class CheckBoxState extends LoginState {}

// final class LoginSuccessSate extends LoginState {
// final AuthEntity authEntity;
//   LoginSuccessSate(this.authEntity);
// }

// final class LoginErrorSate extends LoginState {
//   final String error;
//   LoginErrorSate(this.error);
// }

import 'package:online_exam_app/config/auth_state/base_auth_state.dart';
// import 'package:online_exam_app/features/auth/data/models/user_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';

class AuthState {
  BaseAuthState<AuthEntity> baseAuthState;
  AuthState({required this.baseAuthState});

  AuthState copyWith({BaseAuthState<AuthEntity>? baseAuthState}) {
    return AuthState(baseAuthState: baseAuthState ?? this.baseAuthState);
  }
}
