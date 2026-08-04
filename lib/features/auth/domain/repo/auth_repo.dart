import 'package:online_exam_app/config/base/base_response.dart';

import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {


  Future<BaseResponse<LoginEntity>> login({
    required String email,
    required String password,
  });

}
