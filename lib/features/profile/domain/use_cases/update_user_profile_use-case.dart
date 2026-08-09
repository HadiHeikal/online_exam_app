
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base/base_response.dart';
import 'package:online_exam_app/features/profile/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/profile/domain/repo/profile_repo.dart';



@lazySingleton
class UpdateProfileUseCase {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  Future<BaseResponse<UserEntity>> call({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,

  }) {
    return _repository.updateProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }
}