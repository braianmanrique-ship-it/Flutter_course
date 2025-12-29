part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactions;

  const CounterState({this.counter = 0, this.transactions = 0});

  CounterState copyWith({int? counter, int? transactions}) => CounterState(
    counter: counter ?? this.counter,
    transactions: transactions ?? this.transactions,
  );

  @override
  List<Object?> get props => [counter, transactions];
}
