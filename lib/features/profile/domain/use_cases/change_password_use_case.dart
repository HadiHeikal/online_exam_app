import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/profile/domain/entities/password_entity.dart';

import 'package:online_exam_app/features/profile/domain/repo/profile_repo.dart';


@lazySingleton
class ChangePasswordUseCase {
  final ProfileRepository _repository;

  ChangePasswordUseCase(this._repository);

  Future<BaseResponse<PasswordEntity>> call({
    required String oldPassword,
    required String password,
    required String rePassword,
  }) {
    return _repository.changePassword(
      oldPassword: oldPassword,
        password: password,
      rePassword: rePassword,
    
    );
  }
}