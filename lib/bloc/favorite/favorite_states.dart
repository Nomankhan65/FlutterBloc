import 'package:equatable/equatable.dart';

import '../../model/favorite_list_model.dart';

  enum ListStates{
  loading,success,failure
}
class FavoriteStates extends Equatable{

  final List<FavoriteListModel> favoriteList;
  final List<FavoriteListModel> temFavoriteList;
  final ListStates listStates;

  const FavoriteStates({
   this.favoriteList=const [],
    this.listStates=ListStates.loading,
    this.temFavoriteList=const [],
});

  FavoriteStates copyWith({List<FavoriteListModel>? favoriteListModel,ListStates? listStates,List<FavoriteListModel>? temFavoriteList}){
   return FavoriteStates(
      favoriteList:favoriteListModel ?? favoriteList,
     listStates : listStates ?? this.listStates ,
     temFavoriteList : temFavoriteList ?? this.temFavoriteList,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [favoriteList,listStates,temFavoriteList];


}