import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:online_exam_app/core/constants/api_stings.dart';
import 'package:online_exam_app/features/auth/data/models/login_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/login_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_responce_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@singleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApiStrings.registerEndPoint)
  Future<RegisterResponceModel> register(
    @Body() RegisterRequestModel registerRequestModel,
  );

  @POST(ApiStrings.loginEndPoint)
  Future<LoginResponseModel> login(
    @Body() LoginRequestModel loginRequestModel,
  );
}
