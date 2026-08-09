import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:online_exam_app/features/profile/data/models/change_password_response.dart';
import 'package:online_exam_app/features/profile/data/models/user_response.dart';
import 'package:online_exam_app/features/profile/domain/entities/password_entity.dart';
import 'package:online_exam_app/features/profile/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/profile/domain/repo/profile_repo.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<UserEntity>> getUserProfile() async {
    BaseResponse<UserResponse> response = await _remoteDataSource.getUserProfile();

    switch (response) {
      case SuccessResponse<UserResponse>():
        final userEntity = response.data.user.toEntity();
        return SuccessResponse(userEntity);

      case ErrorResponse<UserResponse>():
        return ErrorResponse(response.error);
    }
  }

  @override
  Future<BaseResponse<UserEntity>> updateProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) async {
    BaseResponse<UserResponse> response = await _remoteDataSource.updateProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
    switch (response) {
      case SuccessResponse<UserResponse>():
        final userEntity = response.data.user.toEntity();
        return SuccessResponse(userEntity);

      case ErrorResponse<UserResponse>():
        return ErrorResponse(response.error);
    }
  }

  @override
  Future<BaseResponse<PasswordEntity>> changePassword({
    required String oldPassword,
    required String password,
    required String rePassword,
  }) async {
    final response = await _remoteDataSource.changePassword(
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );

    switch (response) {
      case SuccessResponse<ChangePasswordResponse>():
        final userEntity = response.data.toEntity();
        return SuccessResponse(userEntity);

      case ErrorResponse<ChangePasswordResponse>():
        return ErrorResponse(response.error);
    }
  }
}
