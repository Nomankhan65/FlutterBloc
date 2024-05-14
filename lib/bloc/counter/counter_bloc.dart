
import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/counter/counter_event.dart';
import 'package:flutterbloc/bloc/counter/counter_state.dart';
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Constructor for CounterBloc.
  // It initializes the Bloc with an initial state of CounterState with counter value 0.
  CounterBloc() : super(const CounterState()) {
    // Define event handlers for IncrementCounter and DecrementCounter events.
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  // Event handler for IncrementCounter event.
  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    // Emit a new CounterState with the counter value incremented by 1.
    emit(state.copyWith(counter: state.counter + 1));
  }

  // Event handler for DecrementCounter event.
  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    // Emit a new CounterState with the counter value decremented by 1.
    emit(state.copyWith(counter: state.counter - 1));
  }
}
