import 'dart:convert';

class WeatherModel {
  WeatherModel({
    this.description,
    this.icon,
  });

  final String description;
  final String icon;

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'icon': icon,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WeatherModel(
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source));
}
