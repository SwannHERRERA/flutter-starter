part of 'login_form_bloc.dart';

class LoginFormState {
  final String username;
  final String password;
  final FormSubmissionStatus formStatus;

  LoginFormState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginFormState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginFormState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
