import 'package:flutterbloc/model/favorite_list_model.dart';

class FavRepository{

  Future<List<FavoriteListModel>> fetchList()async{

    await Future.delayed(const Duration(seconds:3));
    return List.of(generateList(10));
  }

  List<FavoriteListModel> generateList(int length){
    return List.generate(length, (index) => FavoriteListModel(id:'$index', value:'items $index'));
  }
}