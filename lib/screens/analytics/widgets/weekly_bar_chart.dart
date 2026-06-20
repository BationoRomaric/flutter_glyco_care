import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class WeeklyBarChart extends StatelessWidget {
  const WeeklyBarChart({super.key});

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
            color: AppColors.primary.withOpacity(0.06),
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
              Text(
                'Weekly Summary',
                style: AppTypography.headlineMd.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
              Text(
                'Avg: 112 mg/dL',
                style: AppTypography.caption.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar('Mon', 0.6),
                _buildBar('Tue', 0.85),
                _buildBar('Wed', 0.7, isToday: true),
                _buildBar('Thu', 0.45),
                _buildBar('Fri', 0.95),
                _buildBar('Sat', 0.55),
                _buildBar('Sun', 0.4),
              ].map((bar) => Expanded(child: bar)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(String day, double height, {bool isToday = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 180 * height,
            decoration: BoxDecoration(
              color: isToday
                  ? AppColors.primaryContainer.withOpacity(0.6)
                  : AppColors.surfaceContainerHigh,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            day,
            style: AppTypography.caption.copyWith(
              color: isToday ? AppColors.primary : AppColors.onSurfaceVariant,
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}