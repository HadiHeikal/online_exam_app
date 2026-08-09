
sealed class ProfileEvent {
  const ProfileEvent();
}

class FetchUserProfileEvent extends ProfileEvent {
  const FetchUserProfileEvent();
}

class UpdateProfileEvent extends ProfileEvent {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;


  const UpdateProfileEvent({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });
}

class ChangePasswordEvent extends ProfileEvent {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  const ChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}