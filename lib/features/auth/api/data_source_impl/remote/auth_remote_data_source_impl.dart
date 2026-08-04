import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/api/client/auth_api_client.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/register_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_responce_model.dart';

@Injectable(as: AuthRemoteDataSource)
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
}
