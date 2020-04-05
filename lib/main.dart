import 'package:flutter/material.dart';
import 'package:newsapp/screens/welcomeScreen.dart';
import 'screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utilities/app_theme.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen;
//  if( seen == null || seen == false){
    _screen = welcomeScreen();
//  }else{
//    _screen = HomeScreen();
//  }

  runApp(NewsApp(_screen));
}

class NewsApp extends StatelessWidget{
  final Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: this._screen,
    );
  }

}