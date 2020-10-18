import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../shared/models/weather_response_model.dart';
import '../../shared/repositories/i_weather_repository.dart';
import '../../shared/services/geolocation/geolocation_service.dart';
import '../search/search_page.dart';

class HomeController extends GetxController {
  HomeController(this._repo, this._location);

  final IWeatherRepository _repo;
  final GeolocationService _location;

  Rx<WeatherResponseModel> weatherInfo = Rx<WeatherResponseModel>();

  @override
  void onInit() async {
    bool isLocationEnabled = await this._location.checkLocationServiceEnabled();
    if (isLocationEnabled) {
      LocationPermission locationPermission =
          await this._location.checkLocationPermission();
      if (locationPermission != LocationPermission.always ||
          locationPermission != LocationPermission.whileInUse) {
        await this._location.requestLocationPermission();
      } else {}
      Position currentPosition = await this._location.getUserCurrentPosition();
      this.getWeatherFromPosition(
          currentPosition.latitude, currentPosition.longitude);
    }

    super.onInit();
  }

  Future<void> getWeatherFromPosition(double lat, double lon) async {
    try {
      final WeatherResponseModel weatherInfoResponse =
          await this._repo.getWeatherInfoFromLatLon(lat, lon);
      this.weatherInfo.value = weatherInfoResponse;
    } catch (e) {
      print(e);
    }
  }

  void onSearchButtonPressed() {
    Get.toNamed(SearchPage.route);
  }
}
