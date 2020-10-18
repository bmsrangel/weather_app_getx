import 'package:get/get.dart';

import '../../shared/repositories/i_weather_repository.dart';
import 'weather_controller.dart';

class WeatherBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController(Get.find<IWeatherRepository>()));
  }
}
