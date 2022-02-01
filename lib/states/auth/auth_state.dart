part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class NotConnected extends AuthState {}

class Connected extends AuthState {}
