import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/posts.dart';

class SinglePost extends StatefulWidget {
  final Posts post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {

  final comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.post.image_url),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, position) {
              if (position == 0) {
                return _drawPostDetail();
              } else if (position >= 1 && position < 24) {
                return _comments();
              } else {
                return _commentTextEntry();
              }
            }, childCount: 25),
          ),
        ],
      ),
    );
  }

  Widget _drawPostDetail() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Text(
          widget.post.description,
          style: TextStyle(fontSize: 16, letterSpacing: 1, height: 1.3),
        ),
      ),
    );
  }

  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/star.png'),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sami hegazy',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text('Time'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
              'It is basically a fake conversation . Yazzy is the best fake chat generator that can be used for Whatsap'),
        ],
      ),
    );
  }

  Widget _commentTextEntry() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: TextField(
                      controller: comment,
                      decoration: InputDecoration(
                          hintText: 'Write Comment Here',
                          filled: true,
                          focusColor: Color.fromARGB(241, 245, 247, 1),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-16, 16),
                  child: FlatButton(
                    child: Text(
                      'Send',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class UniqueColorGenerator {
  static Random random = new Random();

  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
