import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pracc/counter/cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
        create: (_) => CounterCubit(context), child: const CounterPage2());
  }
}

class CounterPage2 extends StatelessWidget {
  const CounterPage2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterCubitState>(
        buildWhen: (prev, cur) => prev != cur,
        builder: (context, state) {
          final cubit = context.read<CounterCubit>();
          final cubitState = cubit.state;
          return Scaffold(
            appBar: AppBar(title: const Text('CUBIT')),
            body: Center(
              child: Text(cubitState.index.toString(),
                  style: const TextStyle(fontSize: 52)),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'Add',
                  onPressed: () {
                    cubit.add(cubitState.copyWith(index: cubitState.index));
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: 'Minus',
                  onPressed: () {
                    cubit.minus(cubitState.copyWith(index: cubitState.index));
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        });
  }
}
