import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/message_entity.dart';

abstract class AuthRepo {
  Future<BaseResponse<AuthEntity>> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });

  Future<BaseResponse<AuthEntity>> login({
    required String email,
    required String password,
  });

  Future<BaseResponse<MessageEntity>> forgotPassword({
    required String email,
  });

  Future<BaseResponse<MessageEntity>> verifyResetCode({
    required String resetCode,
  });

  Future<BaseResponse<MessageEntity>> resetPassword({
    required String email,
    required String newPassword,
  });
}
