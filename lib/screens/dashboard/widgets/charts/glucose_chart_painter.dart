import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';

class GlucoseChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw the main glucose line
    final linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.65,
      size.width * 0.5,
      size.height * 0.75,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.6,
      size.width,
      size.height * 0.65,
    );

    canvas.drawPath(path, linePaint);

    // Draw target range background
    final rangePaint = Paint()
      ..color = AppColors.secondary.withOpacity(0.03)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.3, size.width, size.height * 0.4),
      rangePaint,
    );

    // Draw dashed lines for target range boundaries
    final dashPaint = Paint()
      ..color = AppColors.secondary.withOpacity(0.2)
      ..strokeWidth = 1;

    _drawDashedLine(
      canvas,
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.3),
      dashPaint,
    );
    _drawDashedLine(
      canvas,
      Offset(0, size.height * 0.7),
      Offset(size.width, size.height * 0.7),
      dashPaint,
    );
  }

  void _drawDashedLine(
      Canvas canvas,
      Offset start,
      Offset end,
      Paint paint,
      ) {
    const dashWidth = 4.0;
    const dashSpace = 4.0;
    final distance = (end - start).distance;
    var drawLength = 0.0;

    while (drawLength < distance) {
      final startPoint = Offset.lerp(start, end, drawLength / distance)!;
      drawLength += dashWidth;
      if (drawLength > distance) drawLength = distance;
      final endPoint = Offset.lerp(start, end, drawLength / distance)!;
      canvas.drawLine(startPoint, endPoint, paint);
      drawLength += dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}