import 'dart:math';
import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final int count;
  final Color color;final double radius;final double width;
  MyCustomPainter({
    this.count = 1,this.color = Colors.red,this.radius = 30,this.width = 1.6,
  });
  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the circle (clock face)
    final circlePaint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / width, size.height / 2), radius, circlePaint);

    // Center dot
    final centerDot = Paint()
      ..color = const Color.fromARGB(255, 0, 255, 30)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / width, size.height / 2), 2, centerDot);

    // Draw clock ticks for each second (small lines)
    final tickPaint = Paint()
      ..color = color
      ..strokeWidth = 1;

    final center = Offset(size.width / width, size.height / 2);

    for (int i = 0; i < 60; i++) {
      double angle = (i * 6) * (count / radius); // Convert degree to radians
      double outerX = center.dx + radius * cos(angle);
      double outerY = center.dy + radius * sin(angle);
      double innerX =
          center.dx + (radius - (i % 5 == 0 ? radius : radius)) * cos(angle);
      double innerY =
          center.dy + (radius - (i % 5 == 0 ? radius : radius)) * sin(angle);

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
