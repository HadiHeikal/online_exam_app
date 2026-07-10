class RegisterEntity {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String id;
  final String role;
  final bool isVerified;
  final DateTime createdAt;

  RegisterEntity({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.id,
    required this.role,
    required this.isVerified,
    required this.createdAt,
  });
}
