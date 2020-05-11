import 'package:flutter/material.dart';
import 'package:newsapp/api/categories_api.dart';
import 'package:newsapp/api/posts_api.dart';
import 'package:newsapp/api/users_api.dart';
import 'package:newsapp/screens/home_tabs/favourites.dart';
import 'package:newsapp/screens/home_tabs/popular.dart';
import 'package:newsapp/screens/home_tabs/whats_new.dart';
import 'package:newsapp/screens/pages/About.dart';
import 'package:newsapp/screens/pages/contact.dart';
import 'package:newsapp/screens/pages/help.dart';
import 'package:newsapp/screens/pages/settings.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum popUopMenu { Help, About, Contact, Settings }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: TextStyle(fontSize: 18),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          _popUpMenu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: 'WHATS NEW',
            ),
            Tab(
              text: 'POPULAR',
            ),
            Tab(
              text: 'FAVOURITES',
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            whatsNew(),
            popular(),
            favourites(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _popUpMenu(BuildContext context) {
    return PopupMenuButton<popUopMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<popUopMenu>(value: popUopMenu.About,child: Text('About'),),
          PopupMenuItem<popUopMenu>(value: popUopMenu.Contact,child: Text('Contact'),),
          PopupMenuItem<popUopMenu>(value: popUopMenu.Help,child: Text('Help'),),
          PopupMenuItem<popUopMenu>(value: popUopMenu.Settings,child: Text('Settings'),),
        ];
      },
      onSelected: (popUopMenu menu) {
        switch (menu){

          case popUopMenu.Help:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Help();
            }));
            break;
          case popUopMenu.About:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AboutUs();
            }));
            break;
          case popUopMenu.Contact:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ContactUs();
            }));
            break;
          case popUopMenu.Settings:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Settings();
            }));
            break;
        }
      },
    );
  }
}
