
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';

import 'package:online_exam_app/features/auth/api/client/auth_api_client.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/login_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/login_response_model.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthApiClient authApiClient;
  AuthRemoteDataSourceImpl(this.authApiClient);



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

}
