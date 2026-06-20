import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class PreferenceItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? trailing;
  final bool isToggle;
  final bool value;
  final bool showChevron;

  const PreferenceItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.isToggle = false,
    this.value = false,
    this.showChevron = false,
  });

  @override
  State<PreferenceItem> createState() => _PreferenceItemState();
}

class _PreferenceItemState extends State<PreferenceItem> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(widget.icon, color: AppColors.primary.withOpacity(0.8), size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTypography.bodyLg.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                if (widget.subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    widget.subtitle!,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (widget.isToggle)
            Switch(
              value: _value,
              onChanged: (value) {
                setState(() => _value = value);
              },
              activeColor: AppColors.primary,
            )
          else if (widget.trailing != null)
            Row(
              children: [
                Text(
                  widget.trailing!,
                  style: AppTypography.labelBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                if (widget.showChevron) ...[
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.expand_more,
                    color: AppColors.outline,
                    size: 20,
                  ),
                ],
              ],
            )
          else if (widget.showChevron)
              const Icon(
                Icons.chevron_right,
                color: AppColors.outline,
              ),
        ],
      ),
    );
  }
}