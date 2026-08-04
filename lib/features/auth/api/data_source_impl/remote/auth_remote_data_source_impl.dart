import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/api/client/auth_api_client.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/forget_password_request.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/verify_reset_code_request.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/reset_password_request.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/message_response_model.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthApiClient authApiClient;
  AuthRemoteDataSourceImpl(this.authApiClient);

  @override
  Future<BaseResponse<MessageResponseModel>> forgotPassword(
    String email,
  ) async {
    try {
      MessageResponseModel response = await authApiClient.forgotPassword(
        ForgetPasswordRequest(email: email),
      );
      return SuccessResponse<MessageResponseModel>(response);
    } on Exception catch (e) {
      return ErrorResponse<MessageResponseModel>(e);
    }
  }

  @override
  Future<BaseResponse<MessageResponseModel>> verifyResetCode(
    String resetCode,
  ) async {
    try {
      MessageResponseModel response = await authApiClient.verifyResetCode(
        VerifyResetCodeRequest(resetCode: resetCode),
      );
      return SuccessResponse<MessageResponseModel>(response);
    } on Exception catch (e) {
      return ErrorResponse<MessageResponseModel>(e);
    }
  }

  @override
  Future<BaseResponse<MessageResponseModel>> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      MessageResponseModel response = await authApiClient.resetPassword(
        ResetPasswordRequest(email: email, newPassword: newPassword),
      );
      return SuccessResponse<MessageResponseModel>(response);
    } on Exception catch (e) {
      return ErrorResponse<MessageResponseModel>(e);
    }
  }
}
