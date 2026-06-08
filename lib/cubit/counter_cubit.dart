import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';
//tow functions increment and decrement will be called by the UI widget and the state will be updated by the cubit
//cubit will emit the new state and the UI widget will rebuild with the new state

class CounterCubit extends Cubit<CounterState> {
  //CounterCubit() : super(CounterInitial()); take no parameters and the initial state is CounterInitial"
  CounterCubit() : super(CounterInitial());
  void increment() {
    emit(CounterUpdate(state.count + 1));
  }

  void decrement() {
    emit(CounterUpdate(state.count - 1));
  }
}
