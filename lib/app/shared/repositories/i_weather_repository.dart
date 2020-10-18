import '../models/weather_response_model.dart';

abstract class IWeatherRepository {
  Future<WeatherResponseModel> getWeatherInfoFromCityName(String cityName);
  Future<WeatherResponseModel> getWeatherInfoFromLatLon(double lat, double lon);
}
