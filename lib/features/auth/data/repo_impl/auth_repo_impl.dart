import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/login_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/login_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/message_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_responce_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/message_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource);
  @override
  Future<BaseResponse<AuthEntity>> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    BaseResponse<RegisterResponceModel> myRegisterResponce =
        await authRemoteDataSource.register(
          RegisterRequestModel(
            username: username,
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            rePassword: rePassword,
            phone: phone,
          ),
        );
    switch (myRegisterResponce) {
      case SuccessResponse<RegisterResponceModel>():
        AuthEntity myRegisterEntity = myRegisterResponce.data.user!.toEntity();
        return SuccessResponse<AuthEntity>(myRegisterEntity);

      case ErrorResponse<RegisterResponceModel>():
        return ErrorResponse<AuthEntity>(myRegisterResponce.error);
    }
  }

  @override
  Future<BaseResponse<AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    BaseResponse<LoginResponseModel> loginResponseModel =
        await authRemoteDataSource.login(
          LoginRequestModel(email: email, password: password),
        );
    switch (loginResponseModel) {
      case SuccessResponse<LoginResponseModel>():
        AuthEntity authEntity = loginResponseModel.data.user!.toEntity();
        return SuccessResponse<AuthEntity>(authEntity);
      case ErrorResponse<LoginResponseModel>():
        return ErrorResponse<AuthEntity>(loginResponseModel.error);
    }
  }

  @override
  Future<BaseResponse<MessageEntity>> forgotPassword({
    required String email,
  }) async {
    BaseResponse<MessageResponseModel> response =
        await authRemoteDataSource.forgotPassword(email);
    switch (response) {
      case SuccessResponse<MessageResponseModel>():
        return SuccessResponse<MessageEntity>(response.data.toEntity());
      case ErrorResponse<MessageResponseModel>():
        return ErrorResponse<MessageEntity>(response.error);
    }
  }

  @override
  Future<BaseResponse<MessageEntity>> verifyResetCode({
    required String resetCode,
  }) async {
    BaseResponse<MessageResponseModel> response =
        await authRemoteDataSource.verifyResetCode(resetCode);
    switch (response) {
      case SuccessResponse<MessageResponseModel>():
        return SuccessResponse<MessageEntity>(response.data.toEntity());
      case ErrorResponse<MessageResponseModel>():
        return ErrorResponse<MessageEntity>(response.error);
    }
  }

  @override
  Future<BaseResponse<MessageEntity>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    BaseResponse<MessageResponseModel> response =
        await authRemoteDataSource.resetPassword(email, newPassword);
    switch (response) {
      case SuccessResponse<MessageResponseModel>():
        return SuccessResponse<MessageEntity>(response.data.toEntity());
      case ErrorResponse<MessageResponseModel>():
        return ErrorResponse<MessageEntity>(response.error);
    }
  }
}
