import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/presentation/bloc/counter/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Transacciones: ${countState.transactions}"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().refresh();
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text("Contador: ${state.counter}");
          },
        ),
      ),
      //floating action button
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment1();
            },
            heroTag: "1",
            child: Text("+1"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment10();
            },
            heroTag: "10",
            child: Text("+10"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement10();
            },
            heroTag: "-10",
            child: Text("-10"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            child: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
    );
  }
}
