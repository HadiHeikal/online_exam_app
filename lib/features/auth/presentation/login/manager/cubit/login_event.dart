sealed class LoginEvent {}

class Authloginevent extends LoginEvent {
  String email;
  String password;
  Authloginevent({required this.email, required this.password});
}

class CheckBox extends LoginEvent {}
