import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => HomePage()
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<MyApp> {
  startTime() async {
    var _duration = Duration(seconds: 5);
    return new Timer(_duration, navigateToHome);
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/ic_cloud.png'),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
