import 'package:equatable/equatable.dart';

import '../../model/favorite_list_model.dart';

  enum ListStates{
  loading,success,failure
}
class FavoriteStates extends Equatable{

  final List<FavoriteListModel> favoriteListModel;
  final ListStates listStates;

  const FavoriteStates({
   this.favoriteListModel=const [],
    this.listStates=ListStates.loading,
});

  FavoriteStates copyWith({List<FavoriteListModel>? favoriteListModel,ListStates? listStates}){
   return FavoriteStates(
      favoriteListModel:favoriteListModel ?? this.favoriteListModel,
     listStates : listStates ?? this.listStates ,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [favoriteListModel,listStates];


}