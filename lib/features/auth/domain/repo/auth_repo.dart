import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/params/params/register_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';

abstract interface class AuthRepo {
  Future<BaseResponse<UserEntity>> register(RegisterParams registerParams);

  Future<BaseResponse<UserEntity>> login({
    required String email,
    required String password,
  });
}
