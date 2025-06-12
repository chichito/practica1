part of 'counter_bloc.dart';

sealed class CounterEvent {}

//Events
class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
