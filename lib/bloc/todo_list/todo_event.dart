import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable{
  const TodoEvents();

}

class AddItems extends TodoEvents{
  final String task;
  const AddItems({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class RemoveItems extends TodoEvents{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}