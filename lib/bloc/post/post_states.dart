import 'package:equatable/equatable.dart';

import '../../model/post_mode;.dart';
import '../../utils/post_status.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> temPostList;
  final String message;
  const PostStates(
      {this.postStatus = PostStatus.loading,
      this.postList = const [],
        this.temPostList=const [],
      this.message = ' '});

  PostStates copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message,List<PostModel>? temPostList}) {
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      temPostList: temPostList ?? this.temPostList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [postList,postStatus,message,temPostList];
}
