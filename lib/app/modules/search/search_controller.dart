import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../shared/services/local_storage/i_local_storage.dart';
import '../weather/weather_page.dart';

class SearchController extends GetxController {
  SearchController(this._storage);

  final ILocalStorageService _storage;

  final TextEditingController cityName$ = TextEditingController();

  Rx<List<String>> searchHistoric = Rx<List<String>>([]);

  @override
  void onInit() {
    this.getHistoricList();
    super.onInit();
  }

  void getHistoricList() async {
    List<String> auxList = await this._storage.getSearchHistoric();
    if (auxList.isNotEmpty) {
      searchHistoric.value = List<String>.from(auxList);
    }
  }

  void removeCityFromHistoric(String cityName) async {
    this.searchHistoric.value.removeWhere((element) => element == cityName);
    this.searchHistoric.refresh();
    await this._storage.removeCityFromHistoric(cityName);
  }

  void onSearchButtonPressed() async {
    String cityName = this.cityName$.text.trim();
    await Get.toNamed(WeatherPage.route, arguments: cityName);
    if (!this.searchHistoric.value.contains(cityName)) {
      this.searchHistoric.value.add(cityName);
      this.searchHistoric.refresh();
      this._storage.addCityToHistoric(cityName);
    }
    this.cityName$.clear();
    print("completed");
  }

  void onSearchHistoricSelected(String cityName) {
    Get.toNamed(WeatherPage.route, arguments: cityName);
  }
}
