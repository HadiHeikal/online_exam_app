import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/profile/domain/entities/password_entity.dart';
import 'package:online_exam_app/features/profile/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/profile/domain/use_cases/change_password_use_case.dart';
import 'package:online_exam_app/features/profile/domain/use_cases/fetch_user_profile_use_case.dart';
import 'package:online_exam_app/features/profile/domain/use_cases/update_user_profile_use-case.dart';
import 'package:online_exam_app/features/profile/presentation/manager/profile_state.dart';

import 'profile_event.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final FetchUserProfileUseCase _fetchUserProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;

  ProfileCubit(
    this._fetchUserProfileUseCase,
    this._updateProfileUseCase,
    this._changePasswordUseCase,
  ) : super(const ProfileState());

  /// MVI Pattern: dispatch events
  void doEvent(ProfileEvent event) {
    switch (event) {
      case FetchUserProfileEvent():
        _onFetchUserProfile();
        break;

      case UpdateProfileEvent():
        _onUpdateProfile(event);
        break;

      case ChangePasswordEvent():
        _onChangePassword(event);
        break;
    }
  }

  /// Handle FetchUserProfileEvent
  Future<void> _onFetchUserProfile() async {
    emit(state.copyWith(isLoading: true));
    BaseResponse<UserEntity> response = await _fetchUserProfileUseCase.call();

    switch (response) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            data: response.data,
            errorMessage: '',
          ),
        );
        break;

      case ErrorResponse<UserEntity>():
        emit(
          state.copyWith(isLoading: false, errorMessage: response.errorMessage),
        );
        break;
    }
  }

  /// Handle UpdateProfileEvent
  Future<void> _onUpdateProfile(UpdateProfileEvent event) async {
    emit(state.copyWith(isLoading: true));

    BaseResponse<UserEntity> response = await _updateProfileUseCase.call(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      phone: event.phone,
    );

    switch (response) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            data: response.data,
            errorMessage: '',
          ),
        );
        break;

      case ErrorResponse<UserEntity>():
        emit(
          state.copyWith(isLoading: false, errorMessage: response.errorMessage),
        );
        break;
    }
  }

  /// Handle ChangePasswordEvent
  Future<void> _onChangePassword(ChangePasswordEvent event) async {
    emit(state.copyWith(isLoading: true));

    BaseResponse<PasswordEntity> response = await _changePasswordUseCase.call(
      oldPassword: event.currentPassword,
      password: event.newPassword,
      rePassword: event.confirmPassword,
    );
    // if (isClosed) return;

    switch (response) {
      case SuccessResponse<PasswordEntity>():
        emit(state.copyWith(isLoading: false, passwordData: response.data));
        break;

      case ErrorResponse<PasswordEntity>():
        emit(
          state.copyWith(isLoading: false, errorMessage: response.errorMessage),
        );
        break;
        
    }
  }
}
