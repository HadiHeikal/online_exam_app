import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String id;
  final String role;
  final bool isVerified;
  final DateTime createdAt;

  const AuthEntity({
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

  @override
  List<Object> get props => [
    username,
    firstName,
    lastName,
    email,
    phone,
    id,
    role,
    isVerified,
    createdAt,
  ];

  @override
  String toString() {
    return 'AuthEntity(username: $username, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, id: $id, role: $role, isVerified: $isVerified, createdAt: $createdAt)';
  }
}
