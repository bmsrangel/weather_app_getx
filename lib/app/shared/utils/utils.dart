class Utils {
  static const String appKey = "<API Key Here>";

  static const String baseUrl = "http://api.openweathermap.org/data/2.5";

  static String getIconUrlByIconId(String iconId) {
    return "http://openweathermap.org/img/wn/$iconId@2x.png";
  }
}
