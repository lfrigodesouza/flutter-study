import 'package:flutter/material.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TopTabsScreen extends StatefulWidget {
  @override
  _TopTabsScreenState createState() => _TopTabsScreenState();
}

class _TopTabsScreenState extends State<TopTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DeliMeals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: 'Categories'),
              Tab(icon: Icon(Icons.star), text: 'Favorites'),
            ],
          ),
        ),
        body: TabBarView(
            children: <Widget>[CategoriesScreen(), FavoritesScreen()]),
      ),
    );
  }
}
