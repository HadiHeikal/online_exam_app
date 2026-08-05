import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/data/models/register_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/register_responce_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<BaseResponse<RegisterResponceModel>> register(
    RegisterRequestModel registerRequestModel,
  );
}
