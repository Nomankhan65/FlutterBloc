import 'package:equatable/equatable.dart';

abstract class FavoriteEvents extends Equatable{

  const FavoriteEvents();


  @override
  List<Object?> get props =>[];
}

class FetchFavoriteList extends FavoriteEvents{
}