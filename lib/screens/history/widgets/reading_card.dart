import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

enum ReadingStatus { normal, elevated, dangerous }

class ReadingData {
  final String label;
  final String time;
  final int value;
  final ReadingStatus status;
  final IconData icon;

  const ReadingData({
    required this.label,
    required this.time,
    required this.value,
    required this.status,
    required this.icon,
  });
}

class ReadingCard extends StatelessWidget {
  final ReadingData data;

  const ReadingCard({super.key, required this.data});

  Color get _statusColor {
    switch (data.status) {
      case ReadingStatus.normal:
        return const Color(0xFF10B981);
      case ReadingStatus.elevated:
        return const Color(0xFFF59E0B);
      case ReadingStatus.dangerous:
        return AppColors.error;
    }
  }

  Color get _valueColor {
    switch (data.status) {
      case ReadingStatus.normal:
        return AppColors.onSurface;
      case ReadingStatus.elevated:
        return AppColors.onSurface;
      case ReadingStatus.dangerous:
        return AppColors.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Icon(
              data.icon,
              color: AppColors.onSurfaceVariant,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.label,
                  style: AppTypography.labelBold.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  data.time,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${data.value}',
                style: AppTypography.headlineMd.copyWith(
                  color: _valueColor,
                ),
              ),
              Text(
                'mg/dL',
                style: AppTypography.caption.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: _statusColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _statusColor.withOpacity(0.5),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}