import 'package:flutter/material.dart';
import 'package:newsapp/models/nav_menu.dart';
import 'package:newsapp/screens/facebook_feeds.dart';
import 'package:newsapp/screens/headline_news.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/instagram_feed.dart';
import 'package:newsapp/screens/pages/loggIn.dart';
import 'package:newsapp/screens/twitter_feed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  List<NavMenuItem> navMenu = [
    NavMenuItem('Explore' , () => HomeScreen()),
    NavMenuItem('Headline News' , () => HeadLineNews()),
    NavMenuItem('Twitter Feeds' , () => TwitterFeed()),
    NavMenuItem('Instagram Feeds' , () => InstagramFeed()),
    NavMenuItem('Facebook Feeds' , () => FacebookFeeds()),
    NavMenuItem('Login' , () => Login()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 70, left: 25),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  navMenu[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return navMenu[position].destination();
                  }));
                },
              ),
            );
          },
          itemCount: navMenu.length,
        ),
      ),
    );
  }
}
