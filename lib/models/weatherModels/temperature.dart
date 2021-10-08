class Temperature {
  late num temp;
  late num feelslike;
  late num humidity;

  Temperature(
      {required this.temp, required this.feelslike, required this.humidity});

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
        temp: json['temp'] == null ? 9 : json['temp'],
        feelslike: json['feels_like'] == null ? 9 : json['feels_like'],
        humidity: json['humidity'] == null ? 9 : json['humidity']);
  }
}
