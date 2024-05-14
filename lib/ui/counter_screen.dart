import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter/counter_bloc.dart';
import 'package:flutterbloc/bloc/counter/counter_event.dart';
import 'package:flutterbloc/bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Build');
    }
    return Scaffold(
      appBar:AppBar(
        title:const Text('Counter Example'),
      ),
      body:  Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
            return Text(state.counter.toString());
          }),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
                if (kDebugMode) {
                  print('Build Increment');
                }
              }, child:const Text('Increment')),

              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementCounter());
                if (kDebugMode) {
                  print('Build Decrement');
                }
              }, child:const Text('Decrement')),

            ],
          )
        ],
      ),
    );
  }
}
