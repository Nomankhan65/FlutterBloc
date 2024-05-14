import 'package:equatable/equatable.dart';
class CounterEvent extends Equatable{

  const CounterEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class IncrementCounter extends CounterEvent{

}

class DecrementCounter extends CounterEvent{

}