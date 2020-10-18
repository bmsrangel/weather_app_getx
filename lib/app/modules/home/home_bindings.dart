import 'package:get/get.dart';

import '../../shared/repositories/i_weather_repository.dart';
import '../../shared/services/geolocation/geolocation_service.dart';
import 'home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
          Get.find<IWeatherRepository>(), Get.find<GeolocationService>()),
    );
  }
}
