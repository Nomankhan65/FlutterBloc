import 'package:equatable/equatable.dart';

import '../../model/favorite_list_model.dart';

  enum ListStates{
  loading,success,failure
}
class FavoriteStates extends Equatable{

  final List<FavoriteListModel> favoriteList;
  final ListStates listStates;

  const FavoriteStates({
   this.favoriteList=const [],
    this.listStates=ListStates.loading,
});

  FavoriteStates copyWith({List<FavoriteListModel>? favoriteListModel,ListStates? listStates}){
   return FavoriteStates(
      favoriteList:favoriteListModel ?? favoriteList,
     listStates : listStates ?? this.listStates ,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [favoriteList,listStates];


}