import 'package:flutter/material.dart';

class CustomAppBarWidget extends AppBar {
  CustomAppBarWidget({
    String titleText,
    IconData rightAppBarButton,
    Function rightAppBarPressed,
  }) : super(
          title: Text(titleText),
          actions: [
            IconButton(
              icon: Icon(rightAppBarButton),
              color: Colors.white,
              onPressed: rightAppBarPressed,
            )
          ],
        );
}
