import 'dart:convert';

class SysModel {
  SysModel({
    this.country,
    this.sunrise,
    this.sunset,
  });

  final String country;
  final int sunrise;
  final int sunset;

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory SysModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SysModel(
      country: map['country'] as String,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SysModel.fromJson(String source) =>
      SysModel.fromMap(json.decode(source));
}
