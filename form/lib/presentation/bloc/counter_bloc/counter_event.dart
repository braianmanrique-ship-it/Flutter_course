part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class CounterIncremented extends CounterEvent {
  final int value;

  const CounterIncremented({this.value = 1});

  @override
  List<Object?> get props => [value];
}

class CounterDecremented extends CounterEvent {
  final int value;

  const CounterDecremented({this.value = 1});

  @override
  List<Object?> get props => [value];
}

class CounterReset extends CounterEvent {
  const CounterReset();

  @override
  List<Object?> get props => [];
}

class CounterIncreased10 extends CounterEvent {
  const CounterIncreased10();

  @override
  List<Object?> get props => [];
}

class CounterDecreased10 extends CounterEvent {
  const CounterDecreased10();

  @override
  List<Object?> get props => [];
}

class CounterHardReset extends CounterEvent {
  const CounterHardReset();

  @override
  List<Object?> get props => [];
}
