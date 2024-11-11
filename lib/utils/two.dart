import 'dart:math';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final int count;
  MyCustomPainter({
    this.count = 1,
  });
  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the circle (clock face)
    final circlePaint = Paint()
      ..color = const Color.fromARGB(255, 255, 1, 1)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 1.6, size.height / 2), 150, circlePaint);

    // Center dot
    final centerDot = Paint()
      ..color = const Color.fromARGB(255, 0, 255, 30)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 1.6, size.height / 2), 8, centerDot);

    // Draw clock ticks for each second (small lines)
    final tickPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 1, 1)
      ..strokeWidth = 2;

    double radius = 150;
    final center = Offset(size.width / 1.6, size.height / 2);

    for (int i = 0; i < 60; i++) {
      double angle = (i * 6) * (count / 180); // Convert degree to radians
      double outerX = center.dx + radius * cos(angle);
      double outerY = center.dy + radius * sin(angle);
      double innerX =
          center.dx + (radius - (i % 5 == 0 ? 180 : 180)) * cos(angle);
      double innerY =
          center.dy + (radius - (i % 5 == 0 ? 180 : 180)) * sin(angle);

      canvas.drawLine(
        Offset(outerX, outerY),
        Offset(innerX, innerY),
        tickPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
