import 'package:flutter/material.dart';

class CustomButtonWidget extends InkWell {
  CustomButtonWidget({
    Function onPressed,
    String buttonText,
    double height,
    double width,
  }) : super(
          onTap: onPressed,
          child: Container(
            height: height ?? 50.0,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        );
}
