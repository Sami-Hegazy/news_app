import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/api/posts_api.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../PageModel.dart';
import 'home_screen.dart';

// ignore: camel_case_types
class welcomeScreen extends StatefulWidget {
  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

// ignore: camel_case_types
class _welcomeScreenState extends State<welcomeScreen> {

  List<PageModel> pages;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel(
        'Welcome',
        'Making Friends is easy as waving your hand back and fourth in easy step',
        Icons.ac_unit,
        'assets/images/ws5.jpg'));

    pages.add(PageModel('Email', 'Add your Email to have many awesome feature',
        Icons.email, 'assets/images/ws3.jpg'));

    pages.add(PageModel(
        'Account Pic',
        'Add the personal pic now, to make people found you easier',
        Icons.account_circle,
        'assets/images/ws4.jpg'));

    pages.add(PageModel(
        'Add Alert',
        'Now you can activate Notification to get Alerts of events',
        Icons.add_alert,
        'assets/images/ws.jpg'));
  }

  @override
  Widget build(BuildContext context) {

    _addPages();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            // ignore: missing_return
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(
                            pages[index].images,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Transform.translate(
                          child: Icon(
                            pages[index].icons,
                            size: 150,
                            color: Colors.white,
                          ),
                          offset: Offset(0, -80),
                        ),
                        Text(pages[index].title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 14, left: 24, right: 24),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
          Transform.translate(
            offset: Offset(0, 150),
            child: Align(
              alignment: Alignment.center,
              child: _displayPageIndicator(pages.length),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: Colors.pinkAccent,
                  child: Text('Get Started',
                      style: TextStyle(color: Colors.white, letterSpacing: 2)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          _updateSeen();
                          return HomeScreen();
                    }));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayPageIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}

//                    Fluttertoast.showToast(
//                      msg: "Welcome",
//                      toastLength: Toast.LENGTH_SHORT,
//                      gravity: ToastGravity.BOTTOM,
//                    );
