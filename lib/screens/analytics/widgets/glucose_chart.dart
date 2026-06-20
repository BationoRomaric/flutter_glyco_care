import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class GlucoseChart extends StatelessWidget {
  final String selectedPeriod;
  final ValueChanged<String> onPeriodChanged;

  const GlucoseChart({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Glucose Profile',
                    style: AppTypography.headlineMd.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '24-hour continuous monitoring',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              _buildPeriodSelector(),
            ],
          ),
          const SizedBox(height: 32),
          Container(
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.outlineVariant.withOpacity(0.3),
              ),
            ),
            child: CustomPaint(
              painter: _GlucoseLinePainter(),
              size: const Size(double.infinity, 280),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['00:00', '06:00', '12:00', '18:00', '23:59']
                .map((time) => Text(
              time,
              style: AppTypography.caption.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: ['Today', 'Yesterday'].map((period) {
          final isSelected = selectedPeriod == period;
          return GestureDetector(
            onTap: () => onPeriodChanged(period),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.surfaceContainerLowest
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                  ),
                ]
                    : null,
              ),
              child: Text(
                period,
                style: AppTypography.labelBold.copyWith(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.onSurfaceVariant,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _GlucoseLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Target range background
    final rangePaint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.2);
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.4),
      rangePaint,
    );

    // Grid lines
    final gridPaint = Paint()
      ..color = AppColors.outlineVariant.withOpacity(0.2)
      ..strokeWidth = 0.5;

    for (double y = 0; y <= size.height; y += size.height / 4) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Glucose line
    final linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.5);
    path.cubicTo(
      size.width * 0.15, size.height * 0.45,
      size.width * 0.3, size.height * 0.55,
      size.width * 0.4, size.height * 0.5,
    );
    path.cubicTo(
      size.width * 0.5, size.height * 0.45,
      size.width * 0.6, size.height * 0.35,
      size.width * 0.7, size.height * 0.4,
    );
    path.cubicTo(
      size.width * 0.8, size.height * 0.45,
      size.width * 0.9, size.height * 0.5,
      size.width, size.height * 0.45,
    );

    canvas.drawPath(path, linePaint);

    // Gradient fill
    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.primary.withValues(alpha: 0.2),
        AppColors.primary.withValues(alpha: 0),
      ],
    );

    final fillPaint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}