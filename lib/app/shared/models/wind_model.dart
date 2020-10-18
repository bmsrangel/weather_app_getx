import 'dart:convert';

class WindModel {
  WindModel({
    this.speed,
    this.deg,
  });

  final double speed;
  final int deg;

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'deg': deg,
    };
  }

  factory WindModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WindModel(
      speed: double.tryParse(map['speed'].toString()),
      deg: map['deg'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WindModel.fromJson(String source) =>
      WindModel.fromMap(json.decode(source));
}
