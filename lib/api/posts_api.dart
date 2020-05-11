import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/posts.dart';
import 'package:newsapp/utilities/api_utitlities.dart';
import 'package:http/http.dart' as http;

class PostsApi {



  Future<List<Posts>> fetchPosts(String id) async {
    List<Posts> allposts =[];
    final response = await http.get('https://api.punkapi.com/v2/beers');

    if (response.statusCode == 200 && allposts != null) {
      var jsonData = jsonDecode(response.body);
      for (var item in jsonData) {
        Posts post = Posts.fromJSON(item);
        allposts.add(post);
      }
    }
    return allposts;

  }


//  Future<Stream<Posts>> getPosts() async {
//    final String url = 'https://api.punkapi.com/v2/beers';
//
//    final client = new http.Client();
//    final streamedRest = await client.send(
//        http.Request('get', Uri.parse(url))
//    );
//
//    return streamedRest.stream
//        .transform(utf8.decoder)
//        .transform(json.decoder)
//        .expand((data) => (data as List))
//        .map((data) => Posts.fromJSON(data));
//  }


//  Future<List<Posts>> fetchAlbum() async {
//    final response = await http.get('https://api.punkapi.com/v2/beers');
//
//    if (response.statusCode == 200) {
//      List jsonresponse =  json.decode(response.body);
//      return jsonresponse.map((post) =>  Posts.fromJSON(post)).toList();
//    }
//    else {
//      throw Exception('Failed to load posts');
//    }
//
//  }


}