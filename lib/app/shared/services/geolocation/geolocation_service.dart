import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeolocationService extends GetxService {
  Future<Position> getUserCurrentPosition() async {
    Position userPosition = await getCurrentPosition();
    return userPosition;
  }

  Future<bool> checkLocationServiceEnabled() async {
    bool isLocationEnabled = await isLocationServiceEnabled();
    return isLocationEnabled;
  }

  Future<LocationPermission> checkLocationPermission() async {
    LocationPermission locationPermission = await checkPermission();
    return locationPermission;
  }

  Future<void> requestLocationPermission() async {
    await requestPermission();
  }
}
