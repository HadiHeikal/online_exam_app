import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object?> get props => [];
}

class RegisterInitialState extends RegisterState {
  const RegisterInitialState();
  @override
  List<Object?> get props => [];
}

class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();
  @override
  List<Object?> get props => [];
}

class RegisterSuccessState extends RegisterState {
  
  final UserEntity userEntity;
 const RegisterSuccessState(this.userEntity);

  @override
  List<Object?> get props => [userEntity];
}

class RegisterErrorState extends RegisterState {
  final String error;

 const RegisterErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
