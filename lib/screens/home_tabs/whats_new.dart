import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class whtsNew extends StatefulWidget {
  @override
  _whatsNewState createState() => _whatsNewState();
}

class _whatsNewState extends State<whtsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _topStories(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(color: Colors.white, fontSize: 22);
    TextStyle _headerDescription = TextStyle(color: Colors.white, fontSize: 16);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.26,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage('assets/images/star.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'How Terries & Royals Gatecrached Final',
                style: _headerTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Lorem  ipsum Dolar sit amet , consecteture adipsing  elit set to aied',
                style: _headerDescription,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
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
          _drawSingleRow(),
          _drawSingleRow(),
          _drawSingleRow(),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 10),
            child: Column(
              children: <Widget>[
                _drawSectionTitle('Recent Updates'),
              ],
            ),
          ),
          _drawRecentUpdateCards(Colors.deepOrange),
          _drawRecentUpdateCards(Colors.teal),
          SizedBox(
            height: 40,
          ),
        ],
      ),
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

  _drawSectionTitle(String title) {
    return Text(title,
        style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w800,
            fontSize: 16));
  }

  Widget _drawRecentUpdateCards(Color color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage('assets/images/star.png'),
              fit: BoxFit.cover,
            )),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Container(
              padding: EdgeInsets.only(left: 24, top: 2, bottom: 2, right: 24),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Sport',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              'Vettel is Ferrari Number One - Hamilton',
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
                  '15 min',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
