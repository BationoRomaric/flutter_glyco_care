import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStatCard(
          title: 'Hypoglycemia',
          value: '2 events',
          valueColor: AppColors.error,
          icon: Icons.trending_down,
          iconColor: AppColors.error,
          iconBgColor: AppColors.errorContainer.withValues(alpha: 0.3), // ✅ Corrigé
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          title: 'Hyperglycemia',
          value: '1 event',
          valueColor: AppColors.primary,
          icon: Icons.trending_up,
          iconColor: AppColors.primary,
          iconBgColor: AppColors.primaryContainer.withValues(alpha: 0.1), // ✅ Corrigé
        ),
        const SizedBox(height: 16),
        _buildAIInsightCard(),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color valueColor,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.2), // ✅ Corrigé
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.04), // ✅ Corrigé
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.labelBold.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: AppTypography.headlineMd.copyWith(
                  color: valueColor,
                ),
              ),
            ],
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildAIInsightCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3), // ✅ Corrigé
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                'AI INSIGHT',
                style: AppTypography.labelBold.copyWith(
                  color: Colors.white.withValues(alpha: 0.9), // ✅ Corrigé
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Your glucose levels were 12% more stable this week. Try maintaining your current activity level.',
            style: AppTypography.bodyLg.copyWith(
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}