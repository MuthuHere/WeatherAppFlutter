import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/forecast/forecast_response.dart';
import 'package:weather_app/model/weather/weather_response.dart';
import 'package:weather_app/widget/widget_forecast.dart';
import 'package:weather_app/widget/widget_today.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  WeatherResponse weatherResponse;
  ForeCastResponse foreCastResponse;

  bool _isLoading = false;
  Location _location = new Location();
  String error;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner : false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: foreCastResponse != null
                          ? SizedBox(
                              height: 150.0,
                              child: showForeCast(foreCastResponse),
                            )
                          : Container(
                              child: Text("No Data"),
                            ),
                    ),
                    showTodayList(weatherResponse,context),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: _isLoading
                            ? CircularProgressIndicator(strokeWidth: 2.0)
                            : IconButton(
                                icon: new Icon(Icons.refresh),
                                tooltip: 'Refresh',
                                onPressed: loadData,
                                color: Colors.purpleAccent,
                              ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void loadData() async {
    setState(() {
      _isLoading = true;
    });

    Map<String, double> _userLocation;

    try {
      _userLocation = await _location.getLocation();
      error = null;
    } catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }
      _userLocation = null;
      print(e);
    }

    if (_userLocation != null) {
      final double latitude = _userLocation['latitude'];
      final double longitude = _userLocation['longitude'];

      print('latitude = ' + latitude.toString());
      print('longitude = ' + longitude.toString());

      final weather = await http.get(
          "https://api.openweathermap.org/data/2.5/weather?APPID=0721392c0ba0af8c410aa9394defa29e&lat=${latitude.toString()}&lon=${longitude.toString()}");

      final forecast = await http.get(
          'https://api.openweathermap.org/data/2.5/forecast?APPID=0721392c0ba0af8c410aa9394defa29e&lat=${latitude.toString()}&lon=${longitude.toString()}');

      if (weather.statusCode == 200 && forecast.statusCode == 200) {
        print(weather.toString());
        print(forecast.toString());
        return setState(() {
          weatherResponse =
              new WeatherResponse.fromJson(json.decode(weather.body));
          foreCastResponse =
              new ForeCastResponse.fromJson(json.decode(forecast.body));
          _isLoading = false;
        });
      }
    }
  }
}

