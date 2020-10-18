import 'package:flutter/material.dart';

import '../../models/weather_response_model.dart';
import '../../utils/utils.dart';
import '../city_temp/city_temp_widget.dart';
import '../min_max/min_max_widget.dart';
import '../weather_condition/weather_condition_widget.dart';

class WeatherDataCardWidget extends StatelessWidget {
  const WeatherDataCardWidget({
    Key key,
    @required this.weatherData,
    @required this.screenWidth,
    @required this.screenHeight,
  }) : super(key: key);

  final WeatherResponseModel weatherData;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: this.screenWidth,
        height: this.screenHeight * .3,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CityTempWidget(
                    cityName: weatherData.name,
                    temperature: weatherData.main.temp,
                  ),
                  WeatherConditionWidget(
                    imageUrl:
                        Utils.getIconUrlByIconId(weatherData.weather.icon),
                    description:
                        this.capitalizeFirst(weatherData.weather.description),
                  ),
                ],
              ),
            ),
            Container(
              width: 130.0,
              child: MinMaxWidget(
                tempMin: weatherData.main.tempMin,
                tempMax: weatherData.main.tempMax,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String capitalizeFirst(String value) {
    return value.substring(0, 1).toUpperCase() + value.substring(1);
  }
}
