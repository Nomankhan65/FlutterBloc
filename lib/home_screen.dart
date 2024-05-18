import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloc/ui/counter_screen.dart';
import 'package:flutterbloc/ui/favorite_screen.dart';
import 'package:flutterbloc/ui/login_screen.dart';
import 'package:flutterbloc/ui/postApi_screen.dart';
import 'package:flutterbloc/ui/slider_screen.dart';
import 'package:flutterbloc/ui/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Bloc State Management',style:TextStyle(color:Colors.white),),
        backgroundColor:Colors.lightBlueAccent,
      ),
      body:ListView(
        children:   [
          Card(
            child: ListTile(
              title:const Text('Bloc Example One'),
              subtitle:const Text('Counter'),
              trailing:const Icon(Icons.arrow_forward_ios_outlined),
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (_)=>const CounterScreen()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('Bloc Example Two'),
              subtitle:const Text('Slider'),
              trailing:const Icon(Icons.arrow_forward_ios_outlined),
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (_)=>const SliderScreen()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('Bloc Example Three'),
              subtitle:const Text('Todo'),
              trailing:const Icon(Icons.arrow_forward_ios_outlined),
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (_)=>const TodoScreen()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('Bloc Example Four'),
              subtitle:const Text('Favorite'),
              trailing:const Icon(Icons.arrow_forward_ios_outlined),
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (_)=> const FavoriteScreen()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('Bloc Example Five'),
              subtitle:const Text('Get postApi'),
              trailing:const Icon(Icons.arrow_forward_ios_outlined),
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (_)=> const PostApiScreen()));
              },
            ),
          ),

          Card(
            child: ListTile(
              title:const Text('Bloc Example Six'),
              subtitle:const Text('Login Api'),
              trailing:const Icon(Icons.arrow_forward_ios_outlined),
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (_)=> const LoginScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
