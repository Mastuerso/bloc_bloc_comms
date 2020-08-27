part of 'stock_bloc.dart';

@immutable
abstract class StockEvent extends Equatable {
  const StockEvent();
}

class StockChanged extends StockEvent {
  final int count;

  StockChanged(this.count);

  @override
  List<Object> get props => [count];

  @override
  String toString() => 'StockChanged count: $count';
}
