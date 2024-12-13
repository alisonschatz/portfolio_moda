import 'package:flutter/material.dart';
import 'dart:math' as math;

class PatternPainter extends CustomPainter {
  final Color color;
  final double spacing;

  PatternPainter({
    required this.color,
    this.spacing = 40,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < size.width; i += spacing.toInt()) {
      for (var j = 0; j < size.height; j += spacing.toInt()) {
        // Add some randomness to the pattern
        final random = math.Random(i * j);
        final offset = random.nextDouble() * 4;
        
        // Draw different shapes randomly
        if (random.nextBool()) {
          canvas.drawCircle(
            Offset(i.toDouble() + offset, j.toDouble() + offset),
            4,
            paint,
          );
        } else {
          canvas.drawRect(
            Rect.fromCenter(
              center: Offset(i.toDouble() + offset, j.toDouble() + offset),
              width: 6,
              height: 6,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}