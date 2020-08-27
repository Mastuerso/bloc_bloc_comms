import 'package:bloc_bloc_comms/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/stock_bloc.dart';
import 'cubit/counter_cubit.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc-Bloc Comms',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bloc-Bloc Comms'),
        ),
        body: CounterStatus(),
        floatingActionButton: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => context.bloc<CounterCubit>().increment(),
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => context.bloc<CounterCubit>().decrement(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CounterStatus extends StatelessWidget {
  const CounterStatus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterCubit counterCubit = CounterCubit();
    return BlocProvider(
      create: (context) => StockBloc(counterCubit),
      child: BlocBuilder<StockBloc, StockState>(
        builder: (context, state) {
          if (state is StockLoaded) {
            return Center(
              child: Text(
                'Stock: ${state.count}',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
