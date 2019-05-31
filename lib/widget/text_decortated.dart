import 'package:flutter/material.dart';

Widget roundedText() {
  return TextField(
    textAlign: TextAlign.center,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      hintText: 'Enter a product name eg. pension',
      hintStyle: TextStyle(fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      contentPadding: EdgeInsets.all(16),
      fillColor: Colors.white70,
    ),
  );
}
