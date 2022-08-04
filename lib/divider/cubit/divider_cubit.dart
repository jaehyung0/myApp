import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DividerCubit extends Cubit<DividerCubitState> {
  final BuildContext context;

  DividerCubit(this.context) : super(DividerCubitState());

  money(DividerCubitState state) => emit(state);

  people(DividerCubitState state) => emit(state);

  update(DividerCubitState state) {
    state.answer = (state.dividend / state.divisor).round();
    return emit(state);
  }
}

class DividerCubitState extends Equatable {
  int divisor = 2;
  int dividend = 2;
  int answer = 1;

  DividerCubitState({this.divisor = 2, this.dividend = 2, this.answer = 1});

  DividerCubitState copyWith({int? divisor, int? dividend, int? answer}) {
    return DividerCubitState(
        divisor: divisor ?? this.divisor,
        dividend: dividend ?? this.dividend,
        answer: answer ?? this.answer);
  }

  @override
  List<Object?> get props => [divisor, dividend, answer];
}
