import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/message_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<MessageResponseModel>> forgotPassword(String email);
  Future<BaseResponse<MessageResponseModel>> verifyResetCode(String resetCode);
  Future<BaseResponse<MessageResponseModel>> resetPassword(
    String email,
    String newPassword,
  );
}
