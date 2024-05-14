import 'package:equatable/equatable.dart';

class CounterState extends Equatable {

  final int counter;
  const CounterState({this.counter = 0});

  // A method to create a new CounterState with updated counter value.
  // If a new value for counter is not provided, it defaults to the current value.
  CounterState copyWith({int? counter}) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  // List of properties that should be considered when comparing two CounterState instances for equality.
  List<Object?> get props => [counter];
}
