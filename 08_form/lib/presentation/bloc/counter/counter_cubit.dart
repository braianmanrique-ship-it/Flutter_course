import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0, transactions: 0));

  void increment1() {
    emit(
      CounterState(
        counter: state.counter + 1,
        transactions: state.transactions + 1,
      ),
    );
  }

  void increment10() {
    emit(
      CounterState(
        counter: state.counter + 10,
        transactions: state.transactions + 1,
      ),
    );
  }

  void decrement10() {
    emit(
      CounterState(
        counter: state.counter - 10,
        transactions: state.transactions + 1,
      ),
    );
  }

  void reset() {
    emit(CounterState(counter: 0, transactions: state.transactions + 1));
  }

  void refresh() {
    emit(CounterState(counter: 0, transactions: 0));
  }
}
