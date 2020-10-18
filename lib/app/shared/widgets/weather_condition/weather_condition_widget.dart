import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget({
    Key key,
    this.imageUrl,
    this.description,
  }) : super(key: key);

  final String imageUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: this.imageUrl,
          height: 60.0,
        ),
        Expanded(
          child: Text(
            this.description,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
          ),
        ),
      ],
    );
  }
}
