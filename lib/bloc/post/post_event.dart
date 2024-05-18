import 'package:equatable/equatable.dart';

class PostEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchedPost extends PostEvent{

}
class FilterPost extends PostEvent{
final String search;
FilterPost(
    this.search
    );
}