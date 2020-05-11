import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/api/posts_api.dart';
import 'package:newsapp/api/users_api.dart';
import 'package:newsapp/models/posts.dart';
import 'dart:async';

import 'package:newsapp/screens/single_post.dart';

class whatsNew extends StatefulWidget {
  @override
  _whatsNewState createState() => _whatsNewState();
}

class _whatsNewState extends State<whatsNew> {

  PostsApi postsApi = PostsApi();
  Future<List<Posts>> fetchPost , fetchRecentUpdate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost = _fetch();
    fetchRecentUpdate = _fetchRecent();

  }

  Future<List<Posts>> _fetch() async {
    return await postsApi.fetchPosts("1");
  }
  Future<List<Posts>> _fetchRecent() async {
    return await postsApi.fetchPosts("2");
  }

  @override
  Widget build(BuildContext context) {
//    postsApi.fetchPosts();

    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _drawHeader(),
            _topStories(),
            _drawRecentUpdates(),
          ],
        ),
      ),
    );
  }

  Widget _drawRecentUpdates() {
    return Container(
      color: Colors.grey.shade300,
      child: FutureBuilder(
        future: fetchRecentUpdate,
        // ignore: missing_return
        builder: (context, AsyncSnapshot snapshot) {
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16, bottom: 8, top: 8),
                        child: _drawSectionTitle('Recent Updates'),
                      ),
                      _drawRecentUpdateCards(Colors.deepOrange , data[0]),
                      _drawRecentUpdateCards(Colors.teal , data[4]),
                      SizedBox(
                        height: 48,
                      ),
                    ],
                  );

                } else {
                  return _noData();
                }
              }
          }


        },
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(color: Colors.white, fontSize: 22);
    TextStyle _headerDescription = TextStyle(color: Colors.white, fontSize: 16);
    return FutureBuilder(
      future: fetchPost,
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
                Random random = Random();
                int rondomIndex = random.nextInt(data.length);
                Posts post = data[rondomIndex];
                return   FutureBuilder(
                  future: fetchPost,
                  builder: (context , AsyncSnapshot snapshot){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SinglePost(post);
                        }));
                      },
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.26,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage('assets/images/star.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  post.tagline.substring(0,15),
                                  style: _headerTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  post.description.substring(0,60),
                                  style: _headerDescription,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );

              } else {
                return _noData();
              }
            }
        }
      },
    );
  }

  Widget _topStories() {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 10),
            child: _drawSectionTitle('Top Stories'),
          ),


          FutureBuilder<List<Posts>>(
            future: fetchPost,
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                      return Column(
                        children: <Widget>[
                          _drawSingleRow(data[0]),
                          _drawSingleRow(data[1]),
                          _drawSingleRow(data[24]),
                        ],
                      );
                    } else {
                      return _noData();
                    }
                  }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _drawSingleRow(Posts post) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(post);
        }));
      },
      child: Padding(
        padding: EdgeInsets.all(0.8),
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      child: Image.network(post.image_url, fit: BoxFit.fill,),
                      width: 80,
                      height: 150,
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
                            padding: const EdgeInsets.only(left: 12),
                            child: Transform.translate(
                              offset: Offset(0, 22),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(child: Text(post.name,),),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2, right: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(Icons.timer),
                                        Text('15 min'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
      ),
    );
  }

  _drawSectionTitle(String title) {
    return Text(title,
        style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w800,
            fontSize: 16));
  }

  Widget _drawRecentUpdateCards(Color color , Posts post) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SinglePost(post);
            }));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(post.image_url),
                      fit: BoxFit.fill,
                    )),
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Container(
                  padding:
                  EdgeInsets.only(left: 24, top: 2, bottom: 2, right: 24),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Sport',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  post.description  ,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Colors.grey,
                    ),
                    Text(
                      post.first_brewed,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
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
