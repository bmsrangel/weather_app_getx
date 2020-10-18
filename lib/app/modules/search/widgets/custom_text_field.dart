import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  CustomTextField({
    TextEditingController controller,
    String hintText,
    TextStyle hintStyle,
  }) : super(
            controller: controller,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: hintStyle.copyWith(
                color: Colors.grey,
                fontSize: 14.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              prefixIcon: Icon(Icons.search),
            ));
}
