import 'package:weather_app/model/weather/weather_response.dart';

class ForeCastResponse {
  final List list;

  ForeCastResponse({this.list});

  factory ForeCastResponse.fromJson(Map<String, dynamic> json) {
    List list = new List();

    for (dynamic e in json['list']) {
      WeatherResponse w = new WeatherResponse(
          date: new DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000,
              isUtc: false),
          name: json['city']['name'],
          temp: e['main']['temp'].toDouble(),
          main: e['weather'][0]['main'],
          icon: e['weather'][0]['icon']);
      list.add(w);
    }

    return ForeCastResponse(
      list: list,
    );
  }
}
