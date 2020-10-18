import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'i_local_storage.dart';

class LocalStorageService extends GetxService implements ILocalStorageService {
  @override
  Future<void> addCityToHistoric(String cityName) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String> searchHistoric = await this.getSearchHistoric();
    searchHistoric.add(cityName);
    await _storage.setStringList("searchHistoric", searchHistoric);
  }

  @override
  Future<List<String>> getSearchHistoric() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String> searchHistoric = _storage.getStringList("searchHistoric");
    if (searchHistoric.isNull) {
      return <String>[];
    } else {
      return searchHistoric;
    }
  }

  @override
  Future<void> removeCityFromHistoric(String cityName) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String> searchHistoric = await this.getSearchHistoric();
    searchHistoric.remove(cityName);
    await _storage.setStringList("searchHistoric", searchHistoric);
  }
}
