import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';


@lazySingleton
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase(this.authRepo);

 Future<BaseResponse<AuthEntity>> call({required String email, required String password}) async{
 BaseResponse<AuthEntity> loginEntity =  await authRepo.login(email: email, password: password);
 return loginEntity;
  }
}
