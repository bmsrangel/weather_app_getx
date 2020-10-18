import 'package:flutter/material.dart';

import '../values/values_widget.dart';

class CityTempWidget extends StatelessWidget {
  const CityTempWidget({
    Key key,
    @required this.cityName,
    @required this.temperature,
  }) : super(key: key);

  final String cityName;
  final double temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.cityName,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 24.0,
                ),
          ),
          const SizedBox(height: 15.0),
          ValuesWidget(
            value: this.temperature,
            unit: "°C",
          ),
        ],
      ),
    );
  }
}
