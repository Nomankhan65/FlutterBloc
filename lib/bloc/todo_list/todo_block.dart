import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/todo_list/todo_event.dart';
import 'package:flutterbloc/bloc/todo_list/todo_states.dart';

class TodoBloc extends Bloc<TodoEvents,TodoStates>{

  final List<String> todoList=[];
TodoBloc():super(const TodoStates()){
 on<AddItems>(_addToItems);
 on<RemoveItems>(_removeToItems);
}


void _addToItems(AddItems event,Emitter<TodoStates> emit){
  todoList.add(event.task);
  emit(state.copyWith(todoList:List.from(todoList)));
}

  void _removeToItems(RemoveItems event,Emitter<TodoStates> emit){
    todoList.remove(event.task);
    emit(state.copyWith(todoList:List.from(todoList)));
  }


}