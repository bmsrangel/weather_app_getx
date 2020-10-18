import 'dart:convert';

class MainModel {
  MainModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MainModel(
      temp: double.tryParse(map['temp'].toString()),
      feelsLike: double.tryParse(map['feels_like'].toString()),
      tempMin: double.tryParse(map['temp_min'].toString()),
      tempMax: double.tryParse(map['temp_max'].toString()),
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) =>
      MainModel.fromMap(json.decode(source));
}
