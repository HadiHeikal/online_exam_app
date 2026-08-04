import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/message_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@lazySingleton
class ChangePasswordUseCase {
  AuthRepo authRepo;
  ChangePasswordUseCase(this.authRepo);

  Future<BaseResponse<MessageEntity>> call({
    required String email,
    required String newPassword,
  }) async {
    BaseResponse<MessageEntity> result = await authRepo.resetPassword(
      email: email,
      newPassword: newPassword,
    );
    return result;
  }
}
