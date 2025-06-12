import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0, email: 'ee')) {
    on<IncrementEvent>((event, emit) {
      final counter = state.counter + 1;
      final value = state.email.toString();
      emit(CounterState(counter: counter, email: value));
    });
    on<DecrementEvent>((event, emit) {
      final counter = state.counter - 1;
      final value = "${state.email} ${counter.toString()}";
      emit(CounterState(counter: counter, email: value));
    });
  }
}
