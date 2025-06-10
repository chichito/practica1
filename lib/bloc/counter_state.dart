part of 'counter_bloc.dart';

class CounterState {
  CounterState({
    required this.counter,
    this.email = 'test@gmail.com',
    this.list = const [],
  });

  final int counter;
  final String email;
  final List<int> list;
}
