part of 'counter_bloc.dart';

@immutable
sealed class CounterState extends Equatable {
  final int count;
  const CounterState(this.count);

  @override
  List<Object?> get props => [count];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterUpdate extends CounterState {
  const CounterUpdate(super.count);
}
