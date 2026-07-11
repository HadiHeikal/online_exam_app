import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';

sealed class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final UserEntity userEntity;
  RegisterSuccessState(this.userEntity);
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}
