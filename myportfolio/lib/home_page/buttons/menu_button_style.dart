import 'package:flutter/material.dart';


final ButtonStyle menuButtonStyle = ButtonStyle(
  elevation: const WidgetStatePropertyAll(5),
  backgroundColor: WidgetStateProperty.all(Colors.transparent),
  foregroundColor: WidgetStateProperty.all(Colors.white),
  overlayColor: WidgetStateProperty.all(Colors.transparent),
  padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 10)),
);