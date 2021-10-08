import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:http_with_dio/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_with_dio/models/dummyModel.dart';
import 'package:http_with_dio/models/open_weather.dart';
import 'package:http_with_dio/models/products.dart';
import 'package:http_with_dio/models/weatherModels/temperature.dart';
import 'package:http_with_dio/models/weatherModels/weather_response.dart';
import 'package:http_with_dio/models/weatherModels/weathermodel.dart';

class ApiService {
  final endPoint =
      'http://165.227.69.207/rehmat-e-sheree/public/api/products/hashlob/web-data/products/get/all/auth';

  void getArticle() async {
    var myRes = await Dio().get(endPoint);
    //  print(myRes.data);
    //Response res = await http.get(Uri.parse(endPoint));

    //   if (res.statusCode == 200) {
    // Map<String, dynamic> json = jsonDecode(res.body);
    //     List<dynamic> body = json['articles'];

    // List<ArticleModel> articles = body.map((e) {
    //   print('JSON: ${e}');

    //   return ArticleModel.fromJson(e);
    // }).toList();

    //     return articles;
    //   } else
    //     throw 'Cant get response';
    // }
  }

  getProducts() async {
    var apiKey =
        'http://165.227.69.207/rehmat-e-sheree/public/api/products/hashlob/web-data/products/get/all/auth';

    var res = await http.get(Uri.parse(apiKey));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['data'];
      //print('BODY: ${body}');
      var products = body.map((e) {
        //print('JSON: ${e}');

        return Products.fromJson(e);
      });
      return products.toList();

      //print(res.data['data']);
      //return Products.fromJson(res.data['data']);
      // var products = res.data.map((e) {
      //   // print(e);
      //   print('Eid: ${e}');
      //   Products.fromJson(e);
      // }).toList();
      //return res.data;
    }
    throw res.statusCode;
  }

  getDummy() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    var res = await Dio().get(url);
    // var json = jsonDecode(res.data);
    return res.data.map((e) {
      return DummyModel.fromJson(e);
    }).toList();
    // var response = await http.get(Uri.parse(url));
    // if (response.statusCode == 200) {
    //   var json = jsonDecode(response.body);
    //   // print('JSON2: ${json[0]}');
    //   return json.map((e) {
    //     return DummyModel.fromJson(e);
    //   }).toList();
    // }
    // var resbody = jsonDecode(response.);
  }

  getWeather() async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=karachi&appid=073020f8a48192bd7422771458bc2c70";
    var res = await Dio().get(url);
    if (res.statusCode == 200) {
      print(res.data['weather']);
      var weather = res.data['weather'];
      return weather.map((e) {
        return WeatherInfo.fromjson(e);
      }).toList();
    } else
      throw "No data";
  }

  getTemperature() async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=karachi&appid=073020f8a48192bd7422771458bc2c70";
    var res = await Dio().get(url);
    if (res.statusCode == 200) {
      return Temperature.fromJson(res.data);
    } else
      throw "error";
  }

  getOpenWeather() async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=karachi&appid=073020f8a48192bd7422771458bc2c70";
    var res = await Dio().get(url);
    print('RES: ${res.data}');
    return WeatherResponse.fromJson(res.data);

    // return res.data.map((e) {
    //   return OpenWeather.fromJson(e);
    // }).toList();
  }
}
