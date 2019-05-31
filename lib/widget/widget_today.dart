import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather/weather_response.dart';

Widget showTodayList(WeatherResponse weatherResponse, BuildContext context) {
  final double deviceWidth = MediaQuery.of(context).size.width;

  return Card(
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          width: deviceWidth * 0.4,
          child: Column(
            children: <Widget>[
              Text(
                'Today',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(weatherResponse != null
                  ? new DateFormat.yMMMEd().format(weatherResponse.date)
                  : "No Date"),
              Text(
                weatherResponse != null ? weatherResponse.name : "No Area",
                style: new TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text('${weatherResponse!=null  ? weatherResponse.temp.toString():"00"}°F',
                  style: new TextStyle(color: Colors.black)),
              Image.network(weatherResponse!=null?
                  'https://openweathermap.org/img/w/${weatherResponse.icon}.png':"https://openweathermap.org/img/w/04d.png"),
              SizedBox(
                height: 2.0,
              ),
              Text(weatherResponse!=null && weatherResponse.main!=null ?
                weatherResponse.main: "No Data",
                style: new TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
