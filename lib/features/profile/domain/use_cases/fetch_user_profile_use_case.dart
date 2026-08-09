import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/profile/domain/entities/user_entity.dart';

import 'package:online_exam_app/features/profile/domain/repo/profile_repo.dart';




@lazySingleton
class FetchUserProfileUseCase {
  final ProfileRepository _repository;

  FetchUserProfileUseCase(this._repository);

  Future<BaseResponse<UserEntity>> call() {
    return _repository.getUserProfile();
  }
}