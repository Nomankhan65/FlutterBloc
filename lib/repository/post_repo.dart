import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutterbloc/model/post_mode;.dart';
import 'package:http/http.dart'as http;

class PostRepo{

  Future<List<PostModel>> fetchPostApi()async{

    try{
      final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if(response.statusCode==200){
        final body=jsonDecode(response.body) as List;
       return body.map((e){
          return PostModel(
            postId:e['postId'] as int,
            email: e['email'] as String,
            body: e['body'] as String,
            id: e['id'] as int,
          );
        }).toList();
      }
    }on  SocketException{
      throw Exception('Error while fetching data');
    }on  TimeoutException{
      throw Exception('Error while fetching data');
    }
    throw Exception('Error while fetching data');


  }
}