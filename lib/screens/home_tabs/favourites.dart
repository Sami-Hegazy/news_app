import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favourites extends StatefulWidget {
  @override
  _favouritesState createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  List<Color> colorsList = [
    Colors.deepOrange,
    Colors.blue,
    Colors.red,
    Colors.teal,
    Colors.pink,
    Colors.purple,
    Colors.orange,
    Colors.yellowAccent,
    Colors.indigo,
    Colors.yellow,
  ];

  Random random = Random();

  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _authorRow(),
                SizedBox(height: 12),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/star.png'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Sami Hegazi',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '15 min . ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Life Style',
                      style: TextStyle(color: _getRandomColor()),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 8),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/star.png'),
                  fit: BoxFit.cover),
            ),
            width: 124,
            height: 124,
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                'Tech Tent : Old phone and save Social',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8,),
              Text(
                'We also taik about the futre of work as the robots advance , and we ask whether a retro phones',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  height: 1.2
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
