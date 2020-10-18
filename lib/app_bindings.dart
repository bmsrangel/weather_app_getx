import 'package:get/get.dart';

import 'app/shared/repositories/i_weather_repository.dart';
import 'app/shared/repositories/weather_repository.dart';
import 'app/shared/services/geolocation/geolocation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IWeatherRepository>(() => WeatherRepository());
    Get.lazyPut(() => GeolocationService());
  }
}
