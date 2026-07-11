import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@lazySingleton
class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

 Future<BaseResponse<UserEntity>> call({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  })async{ {
 BaseResponse<UserEntity> myRegisterEntity =  await authRepo.register(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
    return myRegisterEntity;
  }
}
}
