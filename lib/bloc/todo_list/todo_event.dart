import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable{
  const TodoEvents();

}

class AddItems extends TodoEvents{
  final String task;
  const AddItems({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];

}

class RemoveItems extends TodoEvents{
  final Object task;
  const RemoveItems({required this.task});
  @override
  List<Object?> get props => [task];

}