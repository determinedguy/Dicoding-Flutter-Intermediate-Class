import 'dart:async';
import 'package:flutter/material.dart';
import 'package:submission_1/list_page.dart';
 
class SplashScreen extends StatefulWidget{
  static const routeName = '/splashscreen';

  @override
  _SplashScreen createState() => _SplashScreen();
}
 
class _SplashScreen extends State<SplashScreen>{
 
  void initState(){
    super.initState();
    startSplashScreen();
  }
 
  startSplashScreen () async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.pushReplacementNamed(context, RestaurantListPage.routeName);
    });
  }
 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.food_bank,
              size: 100.0,
              color: Colors.black26,
            ),
            SizedBox(height: 24.0),
            Text(
              "Restaurant",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}