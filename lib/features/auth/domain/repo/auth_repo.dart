import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {
  Future<BaseResponse<AuthEntity>> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });

  Future<BaseResponse<AuthEntity>> login({
    required String email,
    required String password,
  });
}
