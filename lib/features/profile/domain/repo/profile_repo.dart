
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/profile/domain/entities/password_entity.dart';
import 'package:online_exam_app/features/profile/domain/entities/user_entity.dart';




abstract interface class ProfileRepository {
  Future<BaseResponse<UserEntity>> getUserProfile();

  Future<BaseResponse<UserEntity>> updateProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  });

  Future<BaseResponse<PasswordEntity>> changePassword({
    required String oldPassword,
    required String password,
    required String rePassword,
  });
}