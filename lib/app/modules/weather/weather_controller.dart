import 'package:get/get.dart';

import '../../shared/models/weather_response_model.dart';
import '../../shared/repositories/i_weather_repository.dart';

class WeatherController extends GetxController {
  WeatherController(this._repository);

  final IWeatherRepository _repository;

  String cityName;
  Rx<WeatherResponseModel> weatherData = Rx<WeatherResponseModel>();

  showName() {
    this.cityName = Get.arguments;
    this.getWeatherData(this.cityName);
  }

  Future<void> getWeatherData(String cityName) async {
    this.weatherData.value =
        await this._repository.getWeatherInfoFromCityName(cityName);
  }
}
