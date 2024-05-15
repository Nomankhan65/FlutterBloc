import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/todo_list/todo_block.dart';
import 'package:flutterbloc/bloc/todo_list/todo_event.dart';
import 'package:flutterbloc/bloc/todo_list/todo_states.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton:FloatingActionButton(onPressed: (){
        for(int i=0; i<3; i++){
          context.read<TodoBloc>().add(AddItems(task:'Task : $i'));
        }

      },
      child:const Icon(Icons.add),
      ),
      appBar:AppBar(
        title:const Text('Todo Example'),
      ),
      body:BlocBuilder<TodoBloc,TodoStates>(builder: (context,state){
        if(state.todoList.isEmpty){
          return const Center(child:Text('No items found'),);
        }else if(state.todoList.isNotEmpty){

        }else{
          return const SizedBox();
        }
        return ListView.builder
          (
            itemCount:state.todoList.length,
            itemBuilder: (context,index){
          return ListTile(
            title:Text(state.todoList[index].toString()),
            trailing:IconButton(onPressed: (){}
                , icon: const Icon(Icons.delete)),
          );
        });
      }),
    );
  }
}
