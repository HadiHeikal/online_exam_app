import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models/login_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/login_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/message_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_responce_model.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<RegisterResponceModel>> register(
    RegisterRequestModel registerRequestModel,
  );

  Future<BaseResponse<LoginResponseModel>> login(
    LoginRequestModel loginrequestModel,
  );

  Future<BaseResponse<MessageResponseModel>> forgotPassword(String email);

  Future<BaseResponse<MessageResponseModel>> verifyResetCode(String resetCode);

  Future<BaseResponse<MessageResponseModel>> resetPassword(
    String email,
    String newPassword,
  );
}
