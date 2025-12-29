import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/presentation/bloc/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  void counterIncreased(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncremented(value: value));
  }

  void counterIncreased10(BuildContext context, [int value = 10]) {
    context.read<CounterBloc>().add(CounterIncremented(value: value));
  }

  void counterDecreased10(BuildContext context, [int value = -10]) {
    context.read<CounterBloc>().add(CounterDecreased10());
  }

  void reset(BuildContext context, [int value = 0]) {
    context.read<CounterBloc>().add(CounterReset());
  }

  void hardReset(BuildContext context) {
    context.read<CounterBloc>().add(CounterHardReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transacciones: ${context.select((CounterBloc counterBloc) => counterBloc.state.transactions)}",
        ),
        actions: [
          IconButton(
            onPressed: () {
              hardReset(context);
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text("Contador: ${counterBloc.state.counter}"),
        ),
      ),
      //floating action button
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () {
              counterIncreased(context, 1);
            },
            heroTag: "1",
            child: Text("+1"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              counterIncreased10(context, 10);
            },
            heroTag: "10",
            child: Text("+10"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              counterDecreased10(context, -10);
            },
            heroTag: "-10",
            child: Text("-10"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              reset(context, 0);
            },
            child: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
    );
  }
}
