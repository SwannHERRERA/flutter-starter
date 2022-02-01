part of 'login_form_bloc.dart';

@immutable
abstract class LoginFormEvent {}

class LoginFormUpdateUsername extends LoginFormEvent {
  final String username;
  LoginFormUpdateUsername({required this.username});
}

class LoginFormUpdatePassword extends LoginFormEvent {
  final String password;
  LoginFormUpdatePassword({required this.password});
}

class LoginFormSubmitted extends LoginFormEvent {}
