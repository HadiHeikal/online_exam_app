import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/message_entity.dart';

abstract interface class AuthRepo {
  Future<BaseResponse<MessageEntity>> forgotPassword({required String email});
  Future<BaseResponse<MessageEntity>> verifyResetCode({
    required String resetCode,
  });

  Future<BaseResponse<MessageEntity>> resetPassword({
    required String email,
    required String newPassword,
  });
}
