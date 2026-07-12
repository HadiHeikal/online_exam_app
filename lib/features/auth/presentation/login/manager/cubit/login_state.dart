part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitialSate extends LoginState {}

final class LoginLoadingSate extends LoginState {}
final class CheckBoxState extends LoginState {}

final class LoginSuccessSate extends LoginState {
final AuthEntity authEntity;
  LoginSuccessSate(this.authEntity);
}

final class LoginErrorSate extends LoginState {
  final String error;
  LoginErrorSate(this.error);
}
