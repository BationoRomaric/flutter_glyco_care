import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

enum AlertType { criticalLow, highWarning }

class AlertCard extends StatelessWidget {
  final AlertType type;
  final int value;
  final String title;
  final String? message;

  const AlertCard({
    super.key,
    required this.type,
    required this.value,
    required this.title,
    this.message,
  });

  Color get _alertColor {
    switch (type) {
      case AlertType.criticalLow:
        return AppColors.error;
      case AlertType.highWarning:
        return const Color(0xFFF59E0B);
    }
  }

  IconData get _alertIcon {
    switch (type) {
      case AlertType.criticalLow:
        return Icons.warning;
      case AlertType.highWarning:
        return Icons.trending_up;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCritical = type == AlertType.criticalLow;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isCritical
            ? AppColors.errorContainer.withOpacity(0.4)
            : AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCritical
              ? AppColors.error
              : AppColors.outlineVariant.withOpacity(0.5),
          width: isCritical ? 2 : 1,
        ),
        boxShadow: isCritical
            ? [
          BoxShadow(
            color: AppColors.error.withOpacity(0.2),
            blurRadius: 12,
          ),
        ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _alertIcon,
                color: _alertColor,
                size: 40,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.headlineMd.copyWith(
                        color: isCritical
                            ? AppColors.onErrorContainer
                            : AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$value',
                          style: AppTypography.displayReading.copyWith(
                            color: _alertColor,
                            fontSize: 36,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            'mg/dL',
                            style: AppTypography.bodyMd.copyWith(
                              color: isCritical
                                  ? AppColors.onErrorContainer.withOpacity(0.7)
                                  : AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: TextStyle(
                color: isCritical
                    ? AppColors.onErrorContainer
                    : AppColors.onSurfaceVariant,
              ),
            ),
          ],
          const SizedBox(height: 24),
          if (isCritical)
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error, width: 2),
                      minimumSize: const Size(0, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Emergency Call',
                      style: AppTypography.labelBold.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      foregroundColor: AppColors.onError,
                      minimumSize: const Size(0, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Dismiss',
                      style: AppTypography.labelBold.copyWith(
                        color: AppColors.onError,
                      ),
                    ),
                  ),
                ),
              ],
            )
          else
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.medical_services, size: 20),
                label: Text(
                  'Log Insulin Dose',
                  style: AppTypography.labelBold.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}