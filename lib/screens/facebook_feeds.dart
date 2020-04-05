import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';
class FacebookFeeds extends StatefulWidget {
  @override
  _FacebookFeedsState createState() => _FacebookFeedsState();
}

class _FacebookFeedsState extends State<FacebookFeeds> {

  TextStyle _hashTagStyle = TextStyle(
    color: Colors.orangeAccent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Feeds'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _drawHeader(),
                  _drawTitle(),
                  _drawHashtags(),
                  _drawBody(),
                  _drawFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawHeader() {
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
                  color: Colors.grey.shade400,
                ),
                onPressed: () {}),
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

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 16, right: 12),
      child: Text(
        'We also taik about the future of works as the robots',
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

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image(
        image: ExactAssetImage('assets/images/star.png'),
        fit: BoxFit.cover,
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
}
