import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_stings.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/forget_password_request.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/reset_password_request.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/verify_reset_code_request.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/message_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_client.g.dart';

@singleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApiStrings.forgotPasswordEndPoint)
  Future<MessageResponseModel> forgotPassword(
    @Body() ForgetPasswordRequest request,
  );

  @POST(ApiStrings.verifyResetCodeEndPoint)
  Future<MessageResponseModel> verifyResetCode(
    @Body() VerifyResetCodeRequest request,
  );

  @PUT(ApiStrings.resetPasswordEndPoint)
  Future<MessageResponseModel> resetPassword(
    @Body() ResetPasswordRequest request,
  );
}
