import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/post/post_block.dart';
import 'package:flutterbloc/bloc/post/post_event.dart';
import 'package:flutterbloc/bloc/post/post_states.dart';
import 'package:flutterbloc/utils/post_status.dart';

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({super.key});

  @override
  State<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  var searchController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(FetchedPost());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Post Api'),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(
          children: [
            TextFormField(
              controller:searchController,
              decoration:const InputDecoration(
                hintText: 'Search',
                border:OutlineInputBorder(

                )
              ),
              onChanged: (filter){
                context.read<PostBloc>().add(FilterPost(filter));
              },
            ),
            Expanded(
              child: BlocBuilder<PostBloc,PostStates>(builder: (context,states){
                switch(states.postStatus){
                  case PostStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case PostStatus.failure:
                    return Center(child: Text(states.message.toString()));
                  case PostStatus.success:
                    return ListView.builder(
                        itemCount:states.temPostList.isEmpty?states.postList.length:states.temPostList.length,
                        itemBuilder: (context,index){
                          if(states.temPostList.isNotEmpty){
                            final post=states.temPostList[index];
                            return Card(
                              child: ListTile(
                                title:Text(post.email.toString()),
                                subtitle:Text(post.body.toString()),
                              ),
                            );
                          }
                          else{
                            final post=states.postList[index];
                            return Card(
                              child: ListTile(
                                title:Text(post.email.toString()),
                                subtitle:Text(post.body.toString()),
                              ),
                            );
                          }

                    });
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
