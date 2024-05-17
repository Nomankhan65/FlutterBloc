import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/favorite/favorite_block.dart';
import 'package:flutterbloc/bloc/favorite/favorite_events.dart';
import 'package:flutterbloc/bloc/favorite/favorite_states.dart';
import 'package:flutterbloc/model/favorite_list_model.dart';

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
        actions: [
          BlocBuilder<FavoriteBloc,FavoriteStates>(builder: (context,state){
            return  Visibility(
                visible:state.temFavoriteList.isNotEmpty?true:false,
                child:IconButton(onPressed: (){
                  context.read<FavoriteBloc>().add(DeleteItems());
                }, icon: const Icon(Icons.delete,color:Colors.red,)));
          })

        ],
      ),
      body:BlocBuilder<FavoriteBloc,FavoriteStates>(builder: (BuildContext context,state){
        switch(state.listStates){
          case ListStates.loading:
            return const Center(child: CircularProgressIndicator());
          case ListStates.failure:
            return const Text('something went wrong');
          case ListStates.success:
            return ListView.builder(
                itemCount: state.favoriteList.length,
                itemBuilder: (context,index){
                  final item=state.favoriteList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15,vertical:3),
                    child: Card(
                      child: ListTile(
                        leading:Checkbox(value:state.temFavoriteList.contains(item)?true:false, onChanged:(value){
                          if(value!){
                            context.read<FavoriteBloc>().add(SelectItems(item: item));
                          }else{
                            context.read<FavoriteBloc>().add(UnSelectItems(item: item));
                          }
                          
                        }),
                        title:Text(item.value),
                        trailing:IconButton(onPressed: (){
                          FavoriteListModel favoriteListModel=FavoriteListModel(
                            id:item.id,
                            value: item.value,
                            isFav:item.isFav?false:true
                          );
                          context.read<FavoriteBloc>().add(FavoriteItems(item: favoriteListModel));

                        }, icon:Icon(item.isFav?Icons.favorite:Icons.favorite_outline)),
                      ),
                    ),
                  );
                });
          default:
            return const Text('No case match');
        }

      })
    );
  }
}
