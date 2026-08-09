import 'package:equatable/equatable.dart';

class PasswordEntity extends Equatable {
  final String message;
  final String token;

 const PasswordEntity({
    required this.message,
    required this.token,
  });

  @override
 
  List<Object?> get props => [
    message,
    token
  ];


}