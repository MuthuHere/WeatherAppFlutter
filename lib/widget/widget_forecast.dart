import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/forecast/forecast_response.dart';
import 'package:intl/intl.dart';

Widget showForeCast(ForeCastResponse response) {
  return new CarouselSlider(
    items: response.list.map((data) {
      return new Builder(builder: (BuildContext context) {
        return new Container(
          padding: EdgeInsets.all(5.0),
          width: MediaQuery.of(context).size.width,
          margin: new EdgeInsets.symmetric(horizontal: 5.0),
          decoration: new BoxDecoration(color: Colors.pinkAccent),
          child: new Column(
            children: <Widget>[
              Text(
                data.name,
                style: new TextStyle(fontSize: 16.0,color: Colors.white),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(new DateFormat.yMMMd().format(data.date),
                  style: new TextStyle(color: Colors.white)),

              Text('${data.temp.toString()}°F',
                  style: new TextStyle(color: Colors.brown)),
              Image.network(
                  'https://openweathermap.org/img/w/${data.icon}.png'),
              SizedBox(
                height: 2.0,
              ),
              Text(data.main,
                  style: new TextStyle(color: Colors.white, fontSize: 24.0),),
            ],
          ),
        );
      });
    }).toList(),
    viewportFraction: 0.8,
    initialPage: 0,
    aspectRatio: 16 / 9,
    height: 600,
    reverse: false,
    autoPlay: true,
    autoPlayCurve: Curves.easeInOut,
  );
}
