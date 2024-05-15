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
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              const Text('Click'),
              BlocBuilder<SliderBloc, SliderStates>(
                buildWhen: (previous,current)=>previous.isSwitch!=current.isSwitch,
                builder: (context, state) {
               print('object');
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
                width:400,
                height:150,
                color:Colors.lightBlue.withOpacity(state.slider),
              );
            },
          ),
          BlocBuilder<SliderBloc, SliderStates>(
            buildWhen: (previous,current)=>previous.slider!=current.slider,
            builder: (context, state) {
              print('slider');
              return Slider(value:state.slider, onChanged: (val) {
                context.read<SliderBloc>().add(SliderValueChanges(value:val));
              });
            },
          ),
        ],
      ),
    );
  }
}
