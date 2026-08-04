import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/login_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/login_response_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthLocalDataSource authLocalDataSource;
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource , this.authLocalDataSource);
  @override

  @override
  Future<BaseResponse<LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    BaseResponse<LoginResponseModel> loginResponseModel =
        await authRemoteDataSource.login(
          LoginRequestModel(email: email, password: password),
        );
    switch (loginResponseModel) {
      case SuccessResponse<LoginResponseModel>():
        LoginEntity authEntity = loginResponseModel.data.user!.toEntity();
        return SuccessResponse<LoginEntity>(authEntity);
      case ErrorResponse<LoginResponseModel>():
        return ErrorResponse<LoginEntity>(loginResponseModel.error);
    }
  }

}
