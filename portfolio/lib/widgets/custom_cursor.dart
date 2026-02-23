import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CursorPainter extends CustomPainter {
  final List<Offset> positions;
  CursorPainter(this.positions);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryCyan
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final fillPaint = Paint()
      ..color = AppColors.primaryCyan
      ..style = PaintingStyle.fill;

    // Outer circle (leading)
    if (positions.isNotEmpty) {
      canvas.drawCircle(positions[0], 20, paint);
    }
    // Middle circle
    if (positions.length > 1) {
      canvas.drawCircle(positions[1], 12, paint);
    }
    // Small circle
    if (positions.length > 2) {
      canvas.drawCircle(positions[2], 6, paint);
    }
    // Center dot
    if (positions.length > 3) {
      canvas.drawCircle(positions[3], 2, fillPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CursorPainter oldDelegate) => true;
}
