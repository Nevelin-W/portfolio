import 'package:flutter/material.dart';

class LightEffect extends StatelessWidget {
  final Offset position;

  const LightEffect({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx - 50,  // Adjust as needed
      top: position.dy - 50,   // Adjust as needed
      child: Container(
        width: 100,              // Adjust as needed
        height: 100,             // Adjust as needed
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [Colors.white.withOpacity(0.5), Colors.transparent],
            stops: [0.2, 1.0],
          ),
        ),
      ),
    );
  }
}
