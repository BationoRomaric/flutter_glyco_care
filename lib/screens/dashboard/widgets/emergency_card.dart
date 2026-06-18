import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class EmergencyCard extends StatelessWidget {
  const EmergencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.error.withOpacity(0.2),
          width: 2,
        ),
        color: AppColors.errorContainer.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Center(
              child: Icon(
                Icons.emergency,
                color: AppColors.error,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emergency Contact',
                  style: AppTypography.labelBold.copyWith(
                    color: AppColors.error,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Call Dr. Miller',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.call,
            color: AppColors.error,
            size: 24,
          ),
        ],
      ),
    );
  }
}