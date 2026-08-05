import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@lazySingleton
class LoginUseCase {
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);

  Future<BaseResponse<UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return authRepo.login(email: email, password: password);
  }
}
