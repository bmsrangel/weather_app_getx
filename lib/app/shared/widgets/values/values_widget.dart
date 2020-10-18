import 'package:flutter/material.dart';

class ValuesWidget extends StatelessWidget {
  const ValuesWidget({
    Key key,
    @required this.value,
    @required this.unit,
    this.valueFontSize = 38.0,
    this.unitFontSize = 22.0,
  }) : super(key: key);

  final num value;
  final String unit;
  final double valueFontSize;
  final double unitFontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: this.valueFontSize,
            ),
        text: this.value.toStringAsFixed(2),
        children: [
          TextSpan(
            text: this.unit,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: this.unitFontSize,
                ),
          ),
        ],
      ),
    );
  }
}
