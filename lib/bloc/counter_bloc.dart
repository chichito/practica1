import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0, email: 'asdfasdfasdc')) {
    on<IncrementEvent>((event, emit) {
      final value = "${state.email}1";
      emit(CounterState(counter: 0, email: value));
    });
    on<DecrementEvent>((event, emit) {
      final value = "${state.email}12";
      // if (value >= 0) {
      // value = 0;
      emit(CounterState(counter: 0, email: value));
      // }
    });
  }
}
