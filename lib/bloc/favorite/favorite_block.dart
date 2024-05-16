import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/favorite/favorite_events.dart';
import 'package:flutterbloc/bloc/favorite/favorite_states.dart';

import '../../model/favorite_list_model.dart';
import '../../repository/fav_repo.dart';

class FavoriteBloc extends Bloc<FavoriteEvents,FavoriteStates>{
  FavRepository favRepository;
  List<FavoriteListModel>  favoriteListModel=[];

   FavoriteBloc(this.favRepository) :super (const FavoriteStates()){
     on<FetchFavoriteList>(fetchList);

  }

void fetchList(FetchFavoriteList event,Emitter<FavoriteStates> emit)async{
     favoriteListModel=await favRepository.fetchList();
     emit(state.copyWith(favoriteListModel:List.from(favoriteListModel),listStates:ListStates.success));

}
}