import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/params/params/register_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/register_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  Future<BaseResponse<UserEntity>> call(RegisterParams registerParams) async {
    {
      BaseResponse<UserEntity> myRegisterEntity = await authRepo.register(
        registerParams,
      );
      return myRegisterEntity;
    }
  }
}
