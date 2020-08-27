import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(0);
    emit(1);
  }

  void decrement() {
    emit(0);
    emit(-1);
  }
}
