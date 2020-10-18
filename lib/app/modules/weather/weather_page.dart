import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/models/weather_response_model.dart';
import '../../shared/widgets/details_card/details_card_widget.dart';
import '../../shared/widgets/weather_data_card/weather_data_card_widget.dart';
import 'weather_controller.dart';

class WeatherPage extends GetView<WeatherController> {
  static final String route = "/weather";

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    controller.showName();

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados da busca"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.weatherData.value.isNullOrBlank) {
                return CircularProgressIndicator();
              } else {
                WeatherResponseModel weatherData = controller.weatherData.value;
                return WeatherDataCardWidget(
                  weatherData: weatherData,
                  screenWidth: Get.width,
                  screenHeight: Get.height,
                );
              }
            }),
            const SizedBox(height: 20.0),
            Text(
              "Informações adicionais",
              style: textTheme.bodyText1,
            ),
            Container(
              height: 150.0,
              child: Obx(() {
                if (controller.weatherData.value.isNullOrBlank) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  WeatherResponseModel weatherData =
                      controller.weatherData.value;
                  return _buildAdditionalInfo(weatherData);
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  ListView _buildAdditionalInfo(WeatherResponseModel weatherData) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        DetailsCardWidget(
          valueDescription: "Vento",
          value: weatherData.wind.speed,
          unit: "m/s",
        ),
        DetailsCardWidget(
          valueDescription: "Humidade",
          value: weatherData.main.humidity,
          unit: "%",
        ),
        DetailsCardWidget(
          valueDescription: "Pressão",
          value: weatherData.main.pressure,
          unit: "hPa",
        ),
      ],
    );
  }
}
