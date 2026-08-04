import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';


@lazySingleton
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase(this.authRepo);

 Future<BaseResponse<LoginEntity>> call({required String email, required String password}) async{
 BaseResponse<LoginEntity> loginEntity =  await authRepo.login(email: email, password: password);
 return loginEntity;
  }
}
