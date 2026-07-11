import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/register_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_responce_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource);
  @override
  Future<BaseResponse<UserEntity>> register({
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
      UserEntity myRegisterEntity =  myRegisterResponce.data.user!.toEntity();
      return SuccessResponse<UserEntity>(myRegisterEntity);
     
      case ErrorResponse<RegisterResponceModel>():
        return ErrorResponse<UserEntity>(myRegisterResponce.error);
    }
  }
}
