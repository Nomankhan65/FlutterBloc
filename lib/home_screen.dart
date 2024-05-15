import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloc/ui/counter_screen.dart';
import 'package:flutterbloc/ui/slider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Home Screen'),
      ),
      body:ListView(
        children:   [
          ListTile(
            title:const Text('Bloc Example One'),
            subtitle:const Text('Counter'),
            trailing:const Icon(Icons.arrow_forward_ios_outlined),
            onTap:(){
              Navigator.push(context,MaterialPageRoute(builder: (_)=>const CounterScreen()));
            },
          ),
          ListTile(
            title:const Text('Bloc Example Two'),
            subtitle:const Text('Slider'),
            trailing:const Icon(Icons.arrow_forward_ios_outlined),
            onTap:(){
              Navigator.push(context,MaterialPageRoute(builder: (_)=>const SliderScreen()));
            },
          )
        ],
      ),
    );
  }
}
