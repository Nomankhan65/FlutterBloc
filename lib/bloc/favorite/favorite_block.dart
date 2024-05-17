import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/favorite/favorite_events.dart';
import 'package:flutterbloc/bloc/favorite/favorite_states.dart';

import '../../model/favorite_list_model.dart';
import '../../repository/fav_repo.dart';

class FavoriteBloc extends Bloc<FavoriteEvents,FavoriteStates>{
  FavRepository favRepository;
  List<FavoriteListModel>  favoriteList=[];

   FavoriteBloc(this.favRepository) :super (const FavoriteStates()){
     on<FetchFavoriteList>(fetchList);
     on<FavoriteItems>(addRemoveToFav);

  }

void fetchList(FetchFavoriteList event,Emitter<FavoriteStates> emit)async{
     favoriteList=await favRepository.fetchList();
     emit(state.copyWith(favoriteListModel:List.from(favoriteList),listStates:ListStates.success));

}

  void addRemoveToFav(FavoriteItems event,Emitter<FavoriteStates> emit)async{
    final index=favoriteList.indexWhere((element) => element.id==event.item.id);
    favoriteList[index]=event.item;
    emit(state.copyWith(favoriteListModel:List.from(favoriteList),listStates:ListStates.success));
    emit(state.copyWith(favoriteListModel:List.from(favoriteList)));
  }
}