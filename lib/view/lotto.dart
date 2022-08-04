import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pracc/lotto/cubit/lotto_cubit.dart';

class Lotto extends StatelessWidget {
  const Lotto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LottoCubit>(
        create: (_) => LottoCubit(context), child: const LottoPage());
  }
}

class LottoPage extends StatelessWidget {
  const LottoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LottoCubit, LottoCubitState>(
        buildWhen: (prev, cur) => prev != cur,
        builder: (context, state) {
          final cubit = context.read<LottoCubit>();
          final cubitState = cubit.state;
          return Scaffold(
            appBar: AppBar(title: const Text('lotto')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              cubitState.list[0],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              cubitState.list[1],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: FittedBox(
                            child: Text(
                              cubitState.list[2],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: FittedBox(
                            child: Text(
                              cubitState.list[3],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: FittedBox(
                            child: Text(
                              cubitState.list[4],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: FittedBox(
                            child: Text(
                              cubitState.list[5],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        cubit
                            .update(cubitState.copyWith(list: cubitState.list));
                      },
                      child: const Text('슈웃~'))
                ],
              ),
            ),
          );
        });
  }
}
