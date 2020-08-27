part of 'stock_bloc.dart';

@immutable
abstract class StockState extends Equatable {
  const StockState();
}

class StockLoaded extends StockState {
  final int count;

  StockLoaded(this.count);

  @override
  List<Object> get props => [count];
}

class StockError extends StockState {
  @override
  List<Object> get props => [];
}
