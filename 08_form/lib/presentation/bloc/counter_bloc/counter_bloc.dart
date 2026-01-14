import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<CounterIncremented>((event, emit) => _onCounterIncrement(event, emit));
    on<CounterDecremented>((event, emit) => _onCounterDecrement(event, emit));
    on<CounterReset>((event, emit) => _onCounterReset(event, emit));
    on<CounterIncreased10>((event, emit) => _onCounterIncreased10(event, emit));
    on<CounterDecreased10>((event, emit) => _onCounterDecreased10(event, emit));
    on<CounterHardReset>((event, emit) => _onCounterHardReset(event, emit));
  }

  void _onCounterIncrement(
    CounterIncremented event,
    Emitter<CounterState> emit,
  ) {
    emit(
      state.copyWith(
        counter: state.counter + event.value,
        transactions: state.transactions + 1,
      ),
    );
  }

  void _onCounterDecrement(
    CounterDecremented event,
    Emitter<CounterState> emit,
  ) {
    emit(
      state.copyWith(
        counter: state.counter - event.value,
        transactions: state.transactions + 1,
      ),
    );
  }

  void _onCounterReset(
    CounterReset event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(counter: 0, transactions: state.transactions + 1));
  }

  void _onCounterIncreased10(
    CounterIncreased10 event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(counter: state.counter + 10, transactions: state.transactions + 1));
  }

  void _onCounterDecreased10(
    CounterDecreased10 event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(counter: state.counter - 10, transactions: state.transactions + 1));
  }

  void _onCounterHardReset(
    CounterHardReset event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(counter: 0, transactions: 0));
  }
}
