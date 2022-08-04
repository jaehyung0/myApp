import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calculator {}

class LottoCubit extends Cubit<LottoCubitState> {
  final BuildContext context;

  LottoCubit(this.context) : super(LottoCubitState());

  List<String> lotto() {
    List<String> list = [];
    while (list.length != 6) {
      int num = Random().nextInt(45) + 1;
      String numm = num.toString();
      if (num < 10) {
        numm = "0" + num.toString();
      }
      if (!list.contains(numm)) {
        list.add(numm);
      }
    }
    list.sort();
    return list;
  }

  update(LottoCubitState state) {
    state.list = lotto();
    return emit(state);
  }
}

class LottoCubitState extends Equatable {
  List<String> list = ['부', '자', '되', '고', '싶', '다'];
  LottoCubitState({list});

  LottoCubitState copyWith({List<String>? list}) {
    return LottoCubitState(list: list ?? this.list);
  }

  @override
  List<Object?> get props => [list];
}
