import 'package:online_exam_app/config/base/base_state.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';

class AuthState {
  final BaseState<UserEntity> baseAuthState;
  final bool isBoxChecked;

  const AuthState({required this.baseAuthState, this.isBoxChecked = false});

  AuthState copyWith({
    BaseState<UserEntity>? baseAuthState,
    bool? isBoxChecked,
  }) {
    return AuthState(
      baseAuthState: baseAuthState ?? this.baseAuthState,
      isBoxChecked: isBoxChecked ?? this.isBoxChecked,
    );
  }
}
