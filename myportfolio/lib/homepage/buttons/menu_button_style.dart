import 'package:flutter/material.dart';


final ButtonStyle menuButtonStyle = ButtonStyle(
  textStyle: WidgetStateProperty.all(
    const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevation: const WidgetStatePropertyAll(5),
  backgroundColor: WidgetStateProperty.all(Colors.transparent),
  foregroundColor: WidgetStateProperty.all(Colors.white),
);