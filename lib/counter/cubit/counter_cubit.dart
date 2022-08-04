import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  final BuildContext context;

  CounterCubit(this.context) : super(CounterCubitState());

  add(CounterCubitState state) {
    state.index = state.index + 1;
    return emit(state);
  }

  minus(CounterCubitState state) {
    state.index = state.index - 1;
    return emit(state);
  }
}

class CounterCubitState extends Equatable {
  int index = 0;

  CounterCubitState({this.index = 0});

  CounterCubitState copyWith({int? index}) {
    return CounterCubitState(index: index ?? this.index);
  }

  @override
  List<Object?> get props => [index];
}
