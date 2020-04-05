import 'package:flutter/material.dart';

class popular extends StatefulWidget {
  @override
  _popularState createState() => _popularState();
}

class _popularState extends State<popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,position){
      return Card(
        child: _drawSingleRow(),
      );
    },
      itemCount: 20,
    );
  }

  Widget _drawSingleRow() {
    return Padding(
      padding: EdgeInsets.all(0.8),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    child: Image(
                      image: ExactAssetImage('assets/images/star.png'),
                      fit: BoxFit.cover,
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
                            'The Word Global warming Annual Summit',
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
                              Text('Sami Hegazy'),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.timer),
                                  Text('15 min'),
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

}

