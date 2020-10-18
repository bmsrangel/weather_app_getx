import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app/modules/home/home_bindings.dart';
import 'app/modules/home/home_page.dart';
import 'app/modules/search/search_bindings.dart';
import 'app/modules/search/search_page.dart';
import 'app/modules/weather/weather_bindings.dart';
import 'app/modules/weather/weather_page.dart';
import 'app_bindings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xFFEDA51E);
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = "pt_BR";
    initializeDateFormatting("pt_BR");
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: this.primaryColor,
        scaffoldBackgroundColor: this.primaryColor,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          bodyText2: GoogleFonts.montserrat(
              textStyle: TextStyle(color: this.primaryColor, fontSize: 22.0)),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
              headline6: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.w500,
            ),
          )),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: AppBindings(),
      initialRoute: HomePage.route,
      getPages: [
        GetPage(
          name: HomePage.route,
          page: () => HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: SearchPage.route,
          page: () => SearchPage(),
          binding: SearchBindings(),
        ),
        GetPage(
          name: WeatherPage.route,
          page: () => WeatherPage(),
          binding: WeatherBindings(),
        ),
      ],
    );
  }
}
