import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/forget_password_models/message_response_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/message_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<BaseResponse<MessageEntity>> forgotPassword({
    required String email,
  }) async {
    BaseResponse<MessageResponseModel> response = await authRemoteDataSource
        .forgotPassword(email);
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
    BaseResponse<MessageResponseModel> response = await authRemoteDataSource
        .verifyResetCode(resetCode);
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
    BaseResponse<MessageResponseModel> response = await authRemoteDataSource
        .resetPassword(email, newPassword);
    switch (response) {
      case SuccessResponse<MessageResponseModel>():
        return SuccessResponse<MessageEntity>(response.data.toEntity());
      case ErrorResponse<MessageResponseModel>():
        return ErrorResponse<MessageEntity>(response.error);
    }
  }
}
