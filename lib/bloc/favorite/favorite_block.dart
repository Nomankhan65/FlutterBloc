import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/favorite/favorite_events.dart';
import 'package:flutterbloc/bloc/favorite/favorite_states.dart';

import '../../model/favorite_list_model.dart';
import '../../repository/fav_repo.dart';

class FavoriteBloc extends Bloc<FavoriteEvents,FavoriteStates>{
  FavRepository favRepository;
  List<FavoriteListModel>  favoriteList=[];
  List<FavoriteListModel>  temFavoriteList=[];

   FavoriteBloc(this.favRepository) :super (const FavoriteStates()){
     on<FetchFavoriteList>(fetchList);
     on<FavoriteItems>(addRemoveToFav);
     on<SelectItems>(_selectItems);
     on<UnSelectItems>(_unSelectItems);
     on<DeleteItems>(_deleteItems);

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

  void _selectItems(SelectItems event,Emitter<FavoriteStates> emit)async{
   temFavoriteList.add(event.item);
    emit(state.copyWith(temFavoriteList:List.from(temFavoriteList)));

  }

  void _unSelectItems(UnSelectItems event,Emitter<FavoriteStates> emit)async{
    temFavoriteList.remove(event.item);
    emit(state.copyWith(temFavoriteList:List.from(temFavoriteList)));

  }

  void _deleteItems(DeleteItems event,Emitter<FavoriteStates> emit)async{
    for(int i=0; i<temFavoriteList.length; i++){
      favoriteList.remove(temFavoriteList[i]);
    }
    temFavoriteList.clear();
    emit(state.copyWith(
        favoriteListModel:List.from(favoriteList),
        temFavoriteList:List.from(temFavoriteList)));

  }
}