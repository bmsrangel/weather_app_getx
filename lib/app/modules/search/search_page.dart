import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_controller.dart';
import 'widgets/custom_button_widget.dart';
import 'widgets/custom_header_widget.dart';
import 'widgets/custom_text_field.dart';

class SearchPage extends GetView<SearchController> {
  static final String route = "/search";

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[600],
              Colors.grey[400],
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              CustomHeaderWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: CustomTextField(
                  controller: controller.cityName$,
                  hintText: "Nome da cidade",
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              CustomButtonWidget(
                onPressed: controller.onSearchButtonPressed,
                buttonText: "Pesquisar",
                width: Get.width * .5,
              ),
              const SizedBox(height: 25.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pesquisas recentes",
                  style: textTheme.bodyText1,
                ),
              ),
              const SizedBox(height: 5.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Obx(
                    () {
                      if (controller.searchHistoric.value.isEmpty) {
                        return Text(
                          "Nenhuma cidade pesquisada previamente",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return _buildRecentSearches(textTheme);
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GridView _buildRecentSearches(TextTheme textTheme) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      itemCount: controller.searchHistoric.value.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () => controller
              .onSearchHistoricSelected(controller.searchHistoric.value[index]),
          onLongPress: () => controller
              .removeCityFromHistoric(controller.searchHistoric.value[index]),
          child: Card(
            color: Colors.blueGrey[400],
            child: Align(
              alignment: Alignment.center,
              child: Text(
                controller.searchHistoric.value[index],
                style: textTheme.bodyText1,
              ),
            ),
          ),
        );
      },
    );
  }
}
