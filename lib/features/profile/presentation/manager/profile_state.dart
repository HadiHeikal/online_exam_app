import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base/base_state.dart';
import 'package:online_exam_app/features/profile/domain/entities/password_entity.dart';
import 'package:online_exam_app/features/profile/domain/entities/user_entity.dart';

class ProfileState extends  BaseState<UserEntity> with Equatable {
  final PasswordEntity? passwordData;

  const ProfileState({
    super.isLoading,
    super.errorMessage,
    super.data,
    this.passwordData,
  });

  @override
  ProfileState copyWith({
    bool? isLoading,
    String? errorMessage,
    UserEntity? data,
    PasswordEntity? passwordData,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      passwordData: passwordData ?? this.passwordData,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        passwordData,
      ];
}