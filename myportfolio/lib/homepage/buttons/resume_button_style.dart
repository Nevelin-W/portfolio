import 'package:flutter/material.dart';

final ButtonStyle resumeButtonStyle = ButtonStyle(
  elevation: const WidgetStatePropertyAll(5),
  shape: WidgetStateProperty.all(const ContinuousRectangleBorder()),
  side: WidgetStateProperty.resolveWith<BorderSide?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered)) {
        return const BorderSide(color: Colors.white); // Border color on hover
      }
      return const BorderSide(
          color: Colors.transparent); // Default border color
    },
  ),
  backgroundColor: WidgetStateProperty.resolveWith<Color?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered)) {
        return Colors.white; // Background color on hover
      }
      return Colors.transparent; // Default background color
    },
  ),
  foregroundColor: WidgetStateProperty.resolveWith<Color?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered)) {
        return Colors.black; // Foreground color on hover
      }
      return Colors.white; // Default foreground color
    },
  ),
);
