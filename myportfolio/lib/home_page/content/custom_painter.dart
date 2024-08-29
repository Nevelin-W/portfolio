import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final double fillPercentage;

  TrianglePainter(this.fillPercentage);

  @override
  void paint(Canvas canvas, Size size) {
    const double baseStrokeWidth = 50;
    final double strokeWidth = baseStrokeWidth * (1 - fillPercentage);

    final Paint fillPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final Paint shadowPaint = Paint()
      ..color =
          Colors.white.withOpacity(0.15) // Adjust opacity for shadow effect
      ..style = PaintingStyle.fill
      ..maskFilter =
          const MaskFilter.blur(BlurStyle.normal, 5); // Adjust blur radius

    // Define the main triangle path
    final Path trianglePath = Path()
      ..moveTo(size.width / 2, 0) // Top point
      ..lineTo(0, size.height) // Bottom left
      ..lineTo(size.width, size.height) // Bottom right
      ..close();

    // Calculate shadow offset based on border width and fill percentage
    const  double shadowOffset =
        10; // Adjust for how far the shadow should extend
    final Path shadowPath = Path()
      ..moveTo(size.width / 2, 0 - shadowOffset) // Top point
      ..lineTo(0 - shadowOffset, size.height + shadowOffset) // Bottom left
      ..lineTo(
          size.width + shadowOffset, size.height + shadowOffset) // Bottom right
      ..close();

    // Draw the shadow around the whole triangle
    canvas.drawPath(shadowPath, shadowPaint);

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
        ..strokeWidth = strokeWidth;

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
