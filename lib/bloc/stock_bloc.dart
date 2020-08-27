import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_bloc_comms/cubit/counter_cubit.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final CounterCubit counterCubit;
  StreamSubscription reducerSubscription;

  StockBloc(this.counterCubit) : super(StockLoadSuccess(20)) {
    reducerSubscription = counterCubit.listen(
      (Diff data) {
        add(StockChanged(data.value));
      },
    );
  }

  @override
  Future<void> close() {
    reducerSubscription.cancel();
    return super.close();
  }

  @override
  Stream<StockState> mapEventToState(
    StockEvent event,
  ) async* {
    if (event is StockChanged) yield* _mapStockChanged(event, state);
  }

  Stream<StockState> _mapStockChanged(
      StockChanged event, StockState state) async* {
    if (state is StockLoadSuccess) {
      try {
        yield StockLoadSuccess(event.count + state.count);
      } catch (_) {
        yield StockError();
      }
    }
  }
}
