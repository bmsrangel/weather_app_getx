import 'dart:convert';

import 'main_model.dart';
import 'sys_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';

class WeatherResponseModel {
  WeatherResponseModel({
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.dt,
    this.sys,
    this.name,
  });

  final WeatherModel weather;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final int dt;
  final SysModel sys;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'weather': [weather?.toMap()],
      'main': main?.toMap(),
      'visibility': visibility,
      'wind': wind?.toMap(),
      'dt': dt,
      'sys': sys?.toMap(),
      'name': name,
    };
  }

  factory WeatherResponseModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WeatherResponseModel(
      weather: WeatherModel.fromMap(map['weather'][0]),
      main: MainModel.fromMap(map['main']),
      visibility: map['visibility'] as int,
      wind: WindModel.fromMap(map['wind']),
      dt: map['dt'] as int,
      sys: SysModel.fromMap(map['sys']),
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherResponseModel.fromJson(String source) =>
      WeatherResponseModel.fromMap(json.decode(source));
}
