import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  int value = 0;

  void increment() {
    value++;
    emit(state + 1);
  }

  void decrement() => emit(state - 1);

  void reset() => emit(0);

  void setValue(int value) => emit(value);
}

class CounterEvent {}

final class CounterIncrement extends CounterEvent {}

final class CounterDecrement extends CounterEvent {}

final class CounterReset extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) {
      value++;
      emit(state + 1);
    });
    on<CounterDecrement>((event, emit) => emit(state - 1));
    on<CounterReset>((event, emit) => emit(0));
  }

  int value = 0;
  void increment() {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state + 1);
  }
}
