class WeatherInfo {
  late int id;
  late String main;
  late String description;
  late String icon;

  WeatherInfo(this.id, this.main, this.description, this.icon);

  factory WeatherInfo.fromjson(Map<String, dynamic> json) {
    return WeatherInfo(
        json['id'], json['main'], json['description'], json['icon']);
  }
}
