import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/register_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_responce_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/params/params/register_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource);
  @override
  Future<BaseResponse<UserEntity>> register(RegisterParams registerParams) async {
    BaseResponse<RegisterResponceModel> myRegisterResponce =
        await authRemoteDataSource.register(
          RegisterRequestModel(
            username: registerParams.username,
            firstName: registerParams.firstName, 
            lastName:registerParams.lastName ,
            email: registerParams.email,
            password: registerParams.password,
            rePassword:registerParams.rePassword ,
            phone:registerParams.phone,
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
