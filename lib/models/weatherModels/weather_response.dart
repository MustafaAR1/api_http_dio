import 'package:http_with_dio/models/weatherModels/temperature.dart';
import 'package:http_with_dio/models/weatherModels/weathermodel.dart';

class WeatherResponse {
  final cityName;
  final Temperature temperature;
  final WeatherInfo weatherInfo;
  WeatherResponse(
    this.temperature,
    this.weatherInfo,
    this.cityName,
  );

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(Temperature.fromJson(json['main']),
        WeatherInfo.fromjson(json['weather'][0]), json['name']);
  }
}
