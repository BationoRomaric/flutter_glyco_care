import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class TrustElements extends StatelessWidget {
  const TrustElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TrustElementCard(
          icon: Icons.security,
          text: 'Your health data is encrypted with enterprise-grade security and HIPAA-compliant standards.',
          isFirst: true,
        ),
        const SizedBox(height: 12),
        _TrustElementCard(
          icon: Icons.verified,
          text: 'Recommended by over 500+ clinics worldwide for precise glucose management.',
          isFirst: false,
        ),
      ],
    );
  }
}

class _TrustElementCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isFirst;

  const _TrustElementCard({
    required this.icon,
    required this.text,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodyMd.copyWith(
                color: AppColors.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}