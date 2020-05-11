import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/api/posts_api.dart';
import 'package:newsapp/models/posts.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {

  List<int> ads = [];

  TextStyle _hashTagStyle = TextStyle(
    color: Colors.orangeAccent,
  );

  PostsApi postsApi = PostsApi();
  Future<List<Posts>> fetchPost;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost = _fetch();
  }

  Future<List<Posts>> _fetch() async {
    return await postsApi.fetchPosts("4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Feeds'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body:FutureBuilder(
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
                  return ListView.builder(
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _drawHeader(position),
                              _drawTitle(data[position]),
                              _drawHashtags(),
                              _drawBody(data[position]),
                              _drawFooter(),
                            ],
                          ),
                        ),
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
      ),

    );
  }

  Widget _drawHeader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/star.png'),
                radius: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Sami Hegazy',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Fri , 12 May 2017 . 14.30'),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color:(ads.contains(position)) ? Colors.red : Colors.grey.shade400,
                ),
                onPressed: () {
                  if(ads.contains(position)){
                    ads.remove(position);
                  }else{
                    ads.add(position);
                  }
                  setState(() {

                  });
                }),
            Transform.translate(
              offset: Offset(-8, 0),
              child: Text(
                '25',
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawTitle(Posts post) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 16, right: 12),
      child: Text(
        post.tagline,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  Widget _drawHashtags() {
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              )),
        ],
      ),
    );
  }

  Widget _drawBody(Posts post) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image(
        image: NetworkImage(post.image_url),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
            onPressed: () {},
            child: Text(
              '10 comments',
              style: _hashTagStyle,
            )),
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Text(
                  'Share',
                  style: _hashTagStyle,
                )),
            FlatButton(
              onPressed: () {},
              child: Text(
                'open',
                style: _hashTagStyle,
              ),
            )
          ],
        )
      ],
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
