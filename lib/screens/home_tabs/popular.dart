import 'package:flutter/material.dart';
import 'package:newsapp/api/posts_api.dart';
import 'package:newsapp/models/posts.dart';
import 'dart:async';

import 'package:newsapp/screens/single_post.dart';

class popular extends StatefulWidget {
  @override
  _popularState createState() => _popularState();
}

class _popularState extends State<popular> {

  PostsApi postsApi = PostsApi();
  Future<List<Posts>> fetchPop;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPop = _fetch();

  }

  Future<List<Posts>> _fetch() async {
    return await postsApi.fetchPosts("3");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPop,
      // ignore: missing_return
      builder: (context , AsyncSnapshot snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          // TODO : Handle Problem
            return _connectionError();
          case ConnectionState.waiting:
            return new Center(child: new CircularProgressIndicator());
          case ConnectionState.active:
            return new Center(child: new CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              // TODO: handle error
              return _error(snapshot.error);
            } else {
              if (snapshot.hasData) {
                List<Posts> data = snapshot.data;
                return ListView.builder(itemBuilder: (context,position){
                  return Card(
                    child: _drawSingleRow(data[position]),
                  );
                },
                  itemCount: data.length,
                );

              } else {
                return _noData();
              }
            }
        }
      },
    );
  }

  Widget _drawSingleRow(Posts post) {
    return Padding(
      padding: EdgeInsets.all(0.8),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SinglePost(post);
          }));
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    child: Image(
                      image: NetworkImage(post.image_url),
                      fit: BoxFit.fill,
                    ),
                    width: 100,
                    height: 100,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 26),
                          child: Text(
                            post.tagline,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(child: Text(post.name)),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.timer),
                                  Text(post.first_brewed),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _noData() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'No Data Available !!', style: TextStyle(color: Colors.red),),
      ),
    );
  }

  Widget _error(var error) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(error.toString(), style: TextStyle(color: Colors.red),),
      ),
    );
  }

  Widget _connectionError() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Oops Connection Error !!', style: TextStyle(color: Colors.red),),
      ),
    );
  }

}

