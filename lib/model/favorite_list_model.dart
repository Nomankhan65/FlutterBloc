import 'package:equatable/equatable.dart';

class FavoriteListModel extends Equatable{
  final String id;
  final String value;
  final bool isFav;
  final bool isDeleted;
  const FavoriteListModel({
    required this.id,
    required this.value,
    this.isFav=false,
    this.isDeleted=false,
});

  FavoriteListModel copyWith({String? id,String? value,bool? isFav,bool? isDeleted}){
   return FavoriteListModel(
     id:id ?? this.id,
     value:value ?? this.value,
     isFav:isFav ?? this.isFav,
     isDeleted:isDeleted ?? this.isDeleted,
   );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id,value,isFav,isDeleted];



}