import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class ConsentCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const ConsentCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Checkbox
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(top: 2),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isChecked
                    ? AppColors.primary
                    : AppColors.outlineVariant,
                width: 2,
              ),
              color: isChecked ? AppColors.primary : Colors.transparent,
            ),
            child: isChecked
                ? const Icon(
              Icons.check,
              size: 14,
              color: Colors.white,
            )
                : null,
          ),
          const SizedBox(width: 12),
          // Consent Text
          Expanded(
            child: Text.rich(
              TextSpan(
                text:
                'I consent to the secure handling of my health data according to the ',
                style: AppTypography.bodyMd.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
                children: [
                  TextSpan(
                    text: 'Privacy Policy',
                    style: AppTypography.bodyMd.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                    recognizer: null, // Add TapGestureRecognizer for link
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}