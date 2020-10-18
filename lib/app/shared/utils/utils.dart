class Utils {
  static const String appKey = "beeaea5ce7587c7857f1c260e7e3f883";

  static const String baseUrl = "http://api.openweathermap.org/data/2.5";

  static String getIconUrlByIconId(String iconId) {
    return "http://openweathermap.org/img/wn/$iconId@2x.png";
  }
}
