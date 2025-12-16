part of 'counter_cubit.dart';

class CounterState {
  final int counter;
  final int transactions;

  CounterState({required this.counter, required this.transactions});

  copyWith({int? counter, int? transactions}) => CounterState(
    counter: counter ?? this.counter,
    transactions: transactions ?? this.transactions,
  );
}
