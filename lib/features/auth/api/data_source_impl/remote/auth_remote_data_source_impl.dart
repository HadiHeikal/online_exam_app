import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/api/client/auth_api_client.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/login_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/login_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/message_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_responce_model.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthApiClient authApiClient;
  AuthRemoteDataSourceImpl(this.authApiClient);

  @override
  Future<BaseResponse<RegisterResponceModel>> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    try {
      RegisterResponceModel myRegisterResponce = await authApiClient.register(
        registerRequestModel,
      );
      return SuccessResponse<RegisterResponceModel>(myRegisterResponce);
    } on DioException catch (dioException) {
      return ErrorResponse<RegisterResponceModel>(dioException);
    }
  }

  @override
  Future<BaseResponse<LoginResponseModel>> login(
    LoginRequestModel loginrequestModel,
  ) async {
    try {
      LoginResponseModel loginResponseModel = await authApiClient.login(
        loginrequestModel,
      );
      return SuccessResponse<LoginResponseModel>(loginResponseModel);
    } on Exception catch (e) {
      return ErrorResponse<LoginResponseModel>(e);
    }
  }

  @override
  Future<BaseResponse<MessageResponseModel>> forgotPassword(
    String email,
  ) async {
    try {
      MessageResponseModel response = await authApiClient.forgotPassword(
        {'email': email},
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
        {'resetCode': resetCode},
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
        {'email': email, 'newPassword': newPassword},
      );
      return SuccessResponse<MessageResponseModel>(response);
    } on Exception catch (e) {
      return ErrorResponse<MessageResponseModel>(e);
    }
  }
}
