import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feeds'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  _cardHeader(),
                  _cardBody(),
                  _drawLine(),
                  _cardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/star.png'),
            radius: 24,
          ),
        ),
        Column(
          children: <Widget>[
            Row(
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
                  width: 6,
                ),
                Text(
                  '@gmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text('Fri , 12 May 2017 . 14.30'),
          ],
        ),
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16 , bottom: 16),
      child: Text(
        'We also taik about the future of work as the robots advance , and we ask whether a retro phone',
        style: TextStyle(
          fontSize: 16,
          height: 1.3,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  Widget _cardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.repeat),
              onPressed: () {},
              color: Colors.orangeAccent,
            ),
            Text(
              '24',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Text(
                  'Share',
                  style: TextStyle(color: Colors.orangeAccent),
                )),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'Open',
                  style: TextStyle(color: Colors.orangeAccent),
                ))
          ],
        ),
      ],
    );
  }

  Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
    );
  }
}
