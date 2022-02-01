import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(NotConnected()) {
    on<AuthEvent>((event, emit) {
      if (event is Login) {
        emit(Connected());
      } else if (event is Logout) {
        emit(NotConnected());
      }
    });
  }
}
