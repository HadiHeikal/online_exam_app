import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/profile/api/client/profile_api_client.dart';
import 'package:online_exam_app/features/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:online_exam_app/features/profile/data/models/change_password_response.dart';
import 'package:online_exam_app/features/profile/data/models/user_response.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiClient _apiService;

  ProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<UserResponse>> getUserProfile() async {
    try {
      UserResponse response = await _apiService.getUserProfile();

      return SuccessResponse<UserResponse>(response);
    }  on DioException catch (e) {
      return ErrorResponse<UserResponse>(e);
    }
  }

  @override
  Future<BaseResponse<UserResponse>> updateProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) async {
    try {
      UserResponse response = await _apiService.updateProfile(
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phone': phone,
        },
      );

      return SuccessResponse<UserResponse>(response);
    } on DioException catch (e) {
      return ErrorResponse<UserResponse>(e);
    }
  }

  @override
  Future<BaseResponse<ChangePasswordResponse>> changePassword({
    required String oldPassword,
    required String password,
    required String rePassword,
    
  }) async {
    try {
      final response = await _apiService.changePassword(
        oldPassword: oldPassword,
        password: password,
        rePassword: rePassword,
      );

      return SuccessResponse<ChangePasswordResponse>(response);
    } on DioException catch (e) {
      return ErrorResponse<ChangePasswordResponse>(e);
    }
  }
}
