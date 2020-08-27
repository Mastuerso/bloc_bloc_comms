part of 'stock_bloc.dart';

@immutable
abstract class StockState extends Equatable {
  const StockState();
}

class StockLoadSuccess extends StockState {
  final int count;

  StockLoadSuccess(this.count);

  @override
  List<Object> get props => [count];
}

class StockLoadInProgress extends StockState {
  @override
  List<Object> get props => [];
}

class StockError extends StockState {
  @override
  List<Object> get props => [];
}
