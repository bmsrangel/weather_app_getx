abstract class ILocalStorageService {
  Future<List<String>> getSearchHistoric();
  Future<void> addCityToHistoric(String cityName);
  Future<void> removeCityFromHistoric(String cityName);
}
