import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0, false));

  void increment() => emit(CounterState(state.value + 1, true));
  void decrease() => emit(CounterState(state.value - 1, false));
}
