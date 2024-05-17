import 'package:flutterbloc/model/favorite_list_model.dart';

class FavRepository{

  Future<List<FavoriteListModel>> fetchList()async{

    await Future.delayed(const Duration(seconds:1));
    return List.of(generateList(7));
  }

  List<FavoriteListModel> generateList(int length){
    return List.generate(length, (index) => FavoriteListModel(id:'$index', value:'items $index'));
  }
}