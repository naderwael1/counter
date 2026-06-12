import 'package:counter/bloc/counter_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterUpdate(state.count + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterUpdate(state.count - 1));
    });
  }
}
