import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'form_submission_status.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(LoginFormState()) {
    on<LoginFormUpdatePassword>(_handleUpdatePassword);
    on<LoginFormUpdateUsername>(_handleUpdateUsername);
    on<LoginFormSubmitted>(_handleSubmit);
  }

  void _handleUpdatePassword(
      LoginFormUpdatePassword event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _handleUpdateUsername(
      LoginFormUpdateUsername event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _handleSubmit(LoginFormSubmitted event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(formStatus: FormSubmitting()));
    if (state.password == 'azer' && state.username == "swann") {
      print('réussi');
    } else {
      print('raté ${state.password} && ${state.username}');
    }
  }
}
