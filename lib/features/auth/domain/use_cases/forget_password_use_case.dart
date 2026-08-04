import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/message_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@injectable
class ForgetPasswordUseCase {
  AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);

  Future<BaseResponse<MessageEntity>> call({required String email}) async {
    BaseResponse<MessageEntity> result = await authRepo.forgotPassword(
      email: email,
    );
    return result;
  }
}
