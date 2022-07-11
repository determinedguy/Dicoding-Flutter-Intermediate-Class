import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submission_final/common/navigation.dart';
import 'package:submission_final/data/api/api_service.dart';
import 'package:submission_final/data/db/database_helper.dart';
import 'package:submission_final/data/model/restaurant.dart';
import 'package:submission_final/data/preferences/preferences_helper.dart';
import 'package:submission_final/provider/database_provider.dart';
import 'package:submission_final/provider/preferences_provider.dart';
import 'package:submission_final/provider/restaurant_provider.dart';
import 'package:submission_final/provider/scheduling_provider.dart';
import 'package:submission_final/ui/splashscreen.dart';
import 'package:submission_final/ui/restaurant_detail_page.dart';
import 'package:submission_final/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:submission_final/utils/background_service.dart';
import 'package:submission_final/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(apiService: ApiService(), type: 'list', id: ''),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Restaurant',
            theme: provider.themeData,
            navigatorKey: navigatorKey,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              HomePage.routeName: (context) => HomePage(),
              RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
                    restaurant: ModalRoute.of(context)?.settings.arguments
                        as Restaurant,
                  ),
            },
          );
        },
      ),
    );
  }
}
