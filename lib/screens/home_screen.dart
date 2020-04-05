import 'package:flutter/material.dart';
import 'package:newsapp/api/authors_api.dart';
import 'package:newsapp/screens/home_tabs/favourites.dart';
import 'package:newsapp/screens/home_tabs/popular.dart';
import 'package:newsapp/screens/home_tabs/whats_new.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum popUopMenu { Help, About, Contact, Settings }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  AuthorsAPI authorsAPI = AuthorsAPI();

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

    authorsAPI.fetchAllAuthors();

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
            whtsNew(),
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

      },
    );
  }
}
