import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter/counter_bloc.dart';
import 'package:flutterbloc/bloc/favorite/favorite_block.dart';
import 'package:flutterbloc/bloc/favorite/favorite_events.dart';
import 'package:flutterbloc/bloc/post/post_block.dart';
import 'package:flutterbloc/bloc/slider/slider_bloc.dart';
import 'package:flutterbloc/bloc/todo_list/todo_block.dart';
import 'package:flutterbloc/home_screen.dart';
import 'package:flutterbloc/repository/fav_repo.dart';
import 'package:flutterbloc/ui/counter_screen.dart';
import 'package:flutterbloc/ui/slider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>CounterBloc()),
      BlocProvider(create: (_)=>SliderBloc()),
      BlocProvider(create: (_)=>TodoBloc()),
      BlocProvider(create: (_)=>FavoriteBloc(FavRepository())..add(FetchFavoriteList())),
      BlocProvider(create: (_)=>PostBloc()),

    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner:false,
    ),);
  }
}



