import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/data/models/login_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/login_response_model.dart';

abstract class AuthRemoteDataSource {
 

  Future<BaseResponse<LoginResponseModel>> login(
    LoginRequestModel loginrequestModel,
  );


}
