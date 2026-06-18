import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import 'charts/glucose_chart_painter.dart';

class GlucoseCard extends StatelessWidget {
  const GlucoseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppColors.primary.withOpacity(0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CURRENT GLUCOSE',
                    style: AppTypography.labelBold.copyWith(
                      color: AppColors.onSurfaceVariant,
                      letterSpacing: 1.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Measured 10 mins ago',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              _buildStatusBadge(),
            ],
          ),
          const SizedBox(height: 16),
          // Glucose Value
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '112',
                style: AppTypography.displayReading.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'mg/dL',
                  style: AppTypography.headlineMd.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Icon(
                  Icons.trending_flat,
                  color: AppColors.secondary,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Chart
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF004CCD).withOpacity(0.05),
                  Colors.transparent,
                ],
              ),
              border: Border.all(
                color: AppColors.outlineVariant.withOpacity(0.2),
              ),
            ),
            child: CustomPaint(
              painter: GlucoseChartPainter(),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Target Range',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Normal',
            style: AppTypography.labelBold.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}