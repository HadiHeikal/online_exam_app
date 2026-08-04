

import 'package:online_exam_app/config/auth_state/base_auth_state.dart';
// import 'package:online_exam_app/features/auth/data/models/user_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';

class AuthState {
  BaseAuthState<LoginEntity> baseAuthState;
  AuthState({required this.baseAuthState});

  AuthState copyWith({BaseAuthState<LoginEntity>? baseAuthState}) {
    return AuthState(baseAuthState: baseAuthState ?? this.baseAuthState);
  }
}
