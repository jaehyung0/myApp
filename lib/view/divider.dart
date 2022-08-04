import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pracc/divider/cubit/divider_cubit.dart';

class Ndivider extends StatelessWidget {
  const Ndivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DividerCubit>(
        create: (_) => DividerCubit(context), child: const DividerPage());
  }
}

class DividerPage extends StatefulWidget {
  const DividerPage({Key? key}) : super(key: key);

  @override
  State<DividerPage> createState() => _DividerPageState();
}

class _DividerPageState extends State<DividerPage> {
  TextEditingController money = TextEditingController();

  TextEditingController people = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DividerCubit, DividerCubitState>(
        buildWhen: (prev, cur) => prev != cur,
        builder: (context, state) {
          final cubit = context.read<DividerCubit>();
          final cubitState = cubit.state;
          String diMoney = cubitState.answer.toString();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: const Text('엔빵')),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(child: FittedBox(child: Text('$diMoney원'))),
                      SizedBox(
                        height: 400,
                        width: 350,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                controller: money,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    labelText: '총 금액',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                key: UniqueKey(),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                controller: people,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    labelText: '인원수',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                key: UniqueKey(),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                                onPressed: () {
                                  cubit.update(cubitState.copyWith(
                                      dividend: int.parse(money.text),
                                      divisor: int.parse(people.text)));
                                },
                                child: const Text('계산'))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
