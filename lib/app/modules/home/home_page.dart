import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../shared/models/weather_response_model.dart';
import '../../shared/widgets/custom_app_bar/custom_app_bar_widget.dart';
import '../../shared/widgets/details_card/details_card_widget.dart';
import '../../shared/widgets/weather_data_card/weather_data_card_widget.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  static final String route = "/home";

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBarWidget(
        titleText: DateFormat("EEEE, MMM d").format(DateTime.now()),
        rightAppBarButton: Icons.search,
        rightAppBarPressed: controller.onSearchButtonPressed,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () {
                if (controller.weatherInfo.value.isNullOrBlank) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  WeatherResponseModel weatherData =
                      controller.weatherInfo.value;
                  return WeatherDataCardWidget(
                    weatherData: weatherData,
                    screenWidth: Get.width,
                    screenHeight: Get.height,
                  );
                }
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              "Informações adicionais",
              style: textTheme.bodyText1,
            ),
            Container(
              height: 150.0,
              child: Obx(() {
                if (controller.weatherInfo.value.isNullOrBlank) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  WeatherResponseModel weatherData =
                      controller.weatherInfo.value;
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
