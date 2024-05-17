import 'package:equatable/equatable.dart';
import 'package:flutterbloc/model/favorite_list_model.dart';

abstract class FavoriteEvents extends Equatable{

  const FavoriteEvents();


  @override
  List<Object?> get props =>[];
}

class FetchFavoriteList extends FavoriteEvents{
}

class DeleteItems extends FavoriteEvents{
}
class FavoriteItems extends FavoriteEvents{

  final FavoriteListModel item;
  const FavoriteItems({
    required this.item
});

}


class SelectItems extends FavoriteEvents{

  final FavoriteListModel item;
  const SelectItems({
    required this.item
  });

}

class UnSelectItems extends FavoriteEvents{

  final FavoriteListModel item;
  const UnSelectItems({
    required this.item
  });

}