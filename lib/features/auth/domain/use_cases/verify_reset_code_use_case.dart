import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/message_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@injectable
class VerifyResetCodeUseCase {
  AuthRepo authRepo;
  VerifyResetCodeUseCase(this.authRepo);

  Future<BaseResponse<MessageEntity>> call({required String resetCode}) async {
    BaseResponse<MessageEntity> result = await authRepo.verifyResetCode(
      resetCode: resetCode,
    );
    return result;
  }
}
