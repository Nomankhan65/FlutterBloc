import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/post/post_event.dart';
import 'package:flutterbloc/bloc/post/post_states.dart';
import 'package:flutterbloc/repository/post_repo.dart';
import 'package:flutterbloc/utils/post_status.dart';

import '../../model/post_mode;.dart';

class PostBloc extends Bloc<PostEvent,PostStates>{

  PostRepo postRepo =PostRepo();

  List<PostModel> temPostList=  [];

  PostBloc():super(const PostStates()){
    on<FetchedPost>(_fetchPostApi);
    on<FilterPost>(_filterPost);

  }

  void _filterPost(FilterPost event, Emitter<PostStates> emit)async{

    temPostList=state.postList.where((element) =>element.email.toString().toUpperCase().contains(event.search.toUpperCase())).toList();
    emit(state.copyWith(temPostList:temPostList));
  }


  void _fetchPostApi(FetchedPost event, Emitter<PostStates> emit)async{
  await postRepo.fetchPostApi().then((value){
      emit(state.copyWith(
        postStatus:PostStatus.success,
        postList:value,
        message: 'success'
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        postStatus:PostStatus.failure,
        message:error.toString()
      ));
    });

  }
}