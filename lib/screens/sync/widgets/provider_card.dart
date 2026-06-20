import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class ProviderCard extends StatelessWidget {
  final String name;
  final String lastSync;
  final bool isActive;
  final bool isAddNew;

  const ProviderCard({
    super.key,
    required this.name,
    required this.lastSync,
    this.isActive = false,
    this.isAddNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isAddNew
                      ? AppColors.surfaceContainer
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: isAddNew
                    ? const Icon(Icons.add_circle, color: AppColors.outline)
                    : const Icon(Icons.local_hospital, color: AppColors.primary),
              ),
              if (isActive)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'ACTIVE',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                ),
            ],
          ),
          const Spacer(),
          Text(
            name,
            style: AppTypography.headlineMd.copyWith(
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            lastSync,
            style: AppTypography.caption.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}