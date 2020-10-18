import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/weather_response_model.dart';
import '../utils/utils.dart';
import 'i_weather_repository.dart';

class WeatherRepository extends GetxService implements IWeatherRepository {
  final Dio _client = Dio(BaseOptions(baseUrl: Utils.baseUrl, queryParameters: {
    "lang": "pt_br",
    "units": "metric",
    "appid": Utils.appKey,
  }));
  @override
  Future<WeatherResponseModel> getWeatherInfoFromCityName(
      String cityName) async {
    try {
      Response response = await this._client.get("/weather", queryParameters: {
        "q": cityName,
      });
      return WeatherResponseModel.fromMap(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw e.message;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<WeatherResponseModel> getWeatherInfoFromLatLon(
      double lat, double lon) async {
    try {
      Response response = await this._client.get("/weather", queryParameters: {
        "lat": lat.toString(),
        "lon": lon.toString(),
      });
      return WeatherResponseModel.fromMap(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw e.message;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
