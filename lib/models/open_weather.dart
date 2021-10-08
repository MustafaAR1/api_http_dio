import 'package:http_with_dio/models/weatherModels/temperature.dart';
import 'package:http_with_dio/models/weatherModels/weathermodel.dart';

class OpenWeather {
  late String base;
  late num visibility;
  late String cityName;
  late WeatherInfo weather;
  late Temperature temperature;

  OpenWeather(this.base, this.visibility, this.cityName, this.weather,
      this.temperature);

  factory OpenWeather.fromJson(Map<String, dynamic> json) {
    return OpenWeather(
        json['base'],
        json['visibility'],
        json['name'],
        WeatherInfo.fromjson(json['weather']),
        Temperature.fromJson(json['main']));
  }
}
