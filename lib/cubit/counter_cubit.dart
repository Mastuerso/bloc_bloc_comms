import 'package:bloc/bloc.dart';

class Diff {
  const Diff(this.value);

  final int value;

  @override
  String toString() => 'Diff value: $value';
}

class CounterCubit extends Cubit<Diff> {
  CounterCubit() : super(Diff(0));

  void increment() {
    emit(Diff(1));
  }

  void decrement() {
    emit(Diff(-1));
  }
}
