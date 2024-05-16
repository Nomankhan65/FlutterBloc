import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/favorite/favorite_block.dart';
import 'package:flutterbloc/bloc/favorite/favorite_events.dart';
import 'package:flutterbloc/bloc/favorite/favorite_states.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Favorite'),
      ),
      body:BlocBuilder<FavoriteBloc,FavoriteStates>(builder: (BuildContext context,state){
        switch(state.listStates){
          case ListStates.loading:
            return const Center(child: CircularProgressIndicator());
          case ListStates.failure:
            return const Text('something went wrong');
          case ListStates.success:
            return ListView.builder(
                itemCount: state.favoriteListModel.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title:Text(state.favoriteListModel[index].value.toString()),
                  );
                });
          default:
            return const Text('No case match');
        }

      })
    );
  }
}
