import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/change_password_response.dart';
import 'package:online_exam_app/features/profile/data/models/user_response.dart';

abstract interface class ProfileRemoteDataSource {
  Future<BaseResponse<UserResponse>> getUserProfile();

  Future<BaseResponse<UserResponse>> updateProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  });

 Future<BaseResponse<ChangePasswordResponse>> changePassword({
    required String oldPassword,
    required String password,
    required String rePassword,
  });
}