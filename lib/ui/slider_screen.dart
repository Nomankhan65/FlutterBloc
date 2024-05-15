import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/slider/slider_bloc.dart';
import 'package:flutterbloc/bloc/slider/slider_event.dart';
import 'package:flutterbloc/bloc/slider/slider_states.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Example'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              const Text('Click'),
              BlocBuilder<SliderBloc, SliderStates>(
                builder: (context, state) {
                  return Switch(value:state.isSwitch, onChanged: (val) {
                    context.read<SliderBloc>().add(EnableDisableButton());
                    if (kDebugMode) {
                      print(val.toString());
                    }

                  });
                },
              ),
            ],
          ),
          const SizedBox(height:30,),
          BlocBuilder<SliderBloc, SliderStates>(
            builder: (context, state) {
              return Container(
                width:200,
                height:150,
                color:Colors.lightBlue.withOpacity(state.slider),
              );
            },
          ),
          BlocBuilder<SliderBloc, SliderStates>(
            builder: (context, state) {
              return Slider(value:state.slider, onChanged: (val) {
                context.read<SliderBloc>().add(SliderValueChanges(value:val));
                if (kDebugMode) {
                  print(val.toString());
                }

              });
            },
          )
        ],
      ),
    );
  }
}
