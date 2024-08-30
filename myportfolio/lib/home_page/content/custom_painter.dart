import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final double fillPercentage;

  TrianglePainter(this.fillPercentage);

  @override
  void paint(Canvas canvas, Size size) {
    const double baseStrokeWidth = 45;
    final double strokeWidth = baseStrokeWidth * (1 - fillPercentage);

    // Create gradient paint for the fill
    final Paint fillPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Colors.lightBlueAccent,
          Colors.lightGreenAccent
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill
      ..isAntiAlias = true; // Enable anti-aliasing

    // Define the main triangle path
    final Path trianglePath = Path()
      ..moveTo(size.width / 2, 0) // Top point
      ..lineTo(0, size.height) // Bottom left
      ..lineTo(size.width, size.height) // Bottom right
      ..close();

    // Draw the fill of the triangle
    if (fillPercentage > 0) {
      final double halfHeight = size.height / 2;
      final double fillHeight = halfHeight * fillPercentage;
      final double borderOffset = strokeWidth / 2;

      final Path fillPath = Path()
        ..moveTo(
            size.width / 2, halfHeight - fillHeight) // Top of fill from center
        ..lineTo(
            size.width / 2 - (size.width / 2 - borderOffset) * fillPercentage,
            halfHeight + fillHeight) // Bottom left of fill
        ..lineTo(
            size.width / 2 + (size.width / 2 - borderOffset) * fillPercentage,
            halfHeight + fillHeight) // Bottom right of fill
        ..close();

      // Draw the fill triangle
      canvas.drawPath(fillPath, fillPaint);
    }

    // Draw the border only if fillPercentage is less than 100%
    if (fillPercentage < 1) {
      final Paint borderPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..isAntiAlias = true; // Enable anti-aliasing

      // Draw the border of the main triangle
      canvas.drawPath(trianglePath, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is TrianglePainter &&
        oldDelegate.fillPercentage != fillPercentage;
  }
}
