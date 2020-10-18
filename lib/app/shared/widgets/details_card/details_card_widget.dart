import 'package:flutter/material.dart';

import '../values/values_widget.dart';

class DetailsCardWidget extends Card {
  DetailsCardWidget({
    String valueDescription,
    num value,
    String unit,
  }) : super(
          child: Container(
            width: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(valueDescription),
                ValuesWidget(
                  value: value,
                  unit: unit,
                ),
              ],
            ),
          ),
        );
}
