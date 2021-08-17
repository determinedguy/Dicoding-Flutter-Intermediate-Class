import 'package:submission_final/data/db/database_helper.dart';
import 'package:submission_final/provider/database_provider.dart';
import 'package:submission_final/ui/favorites_page.dart';
import 'package:submission_final/ui/restaurant_detail_page.dart';
import 'package:submission_final/ui/restaurant_list_page.dart';
import 'package:submission_final/utils/notification_helper.dart';
import 'package:submission_final/ui/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  // To solve late-initialized problem, initialize the database provider and add it as a parameter to the favorite page
  static DatabaseProvider databaseProvider = DatabaseProvider(databaseHelper: DatabaseHelper());

  int _bottomNavIndex = 0;
  static const String _restaurantText = 'Restaurant';

  List<Widget> _listWidget = [
    RestaurantListPage(),
    FavoritesPage(provider: databaseProvider),
    SettingsPage(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.food_bank),
      label: _restaurantText,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: FavoritesPage.favoritesTitle,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: SettingsPage.settingsTitle,
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(RestaurantDetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
