import 'package:flutter/material.dart';

import '../values/values_widget.dart';

class MinMaxWidget extends StatelessWidget {
  const MinMaxWidget({
    Key key,
    @required this.tempMin,
    @required this.tempMax,
  }) : super(key: key);

  final double tempMin;
  final double tempMax;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Mín"),
          ValuesWidget(
            value: this.tempMin,
            unit: "°C",
            valueFontSize: 26.0,
            unitFontSize: 18.0,
          ),
          const SizedBox(height: 20.0),
          Text("Máx"),
          ValuesWidget(
            value: this.tempMax,
            unit: "°C",
            valueFontSize: 26.0,
            unitFontSize: 18.0,
          ),
        ],
      ),
    );
  }
}
