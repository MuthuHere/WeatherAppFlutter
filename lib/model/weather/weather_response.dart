class WeatherResponse {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;

  WeatherResponse({this.date, this.name, this.temp, this.main, this.icon});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
}
