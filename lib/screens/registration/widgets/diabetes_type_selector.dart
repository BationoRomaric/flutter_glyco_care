import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class DiabetesTypeSelector extends StatelessWidget {
  final String? selectedType;
  final ValueChanged<String> onTypeSelected;

  const DiabetesTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  static const _types = [
    _DiabetesType(label: 'Type 1', value: 'type1'),
    _DiabetesType(label: 'Type 2', value: 'type2'),
    _DiabetesType(label: 'Gestational', value: 'gestational'),
    _DiabetesType(label: 'Other', value: 'other'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _types.map((type) {
        final isSelected = selectedType == type.value;
        return _DiabetesTypeChip(
          label: type.label,
          isSelected: isSelected,
          onTap: () => onTypeSelected(type.value),
        );
      }).toList(),
    );
  }
}

class _DiabetesType {
  final String label;
  final String value;

  const _DiabetesType({
    required this.label,
    required this.value,
  });
}

class _DiabetesTypeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _DiabetesTypeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: (MediaQuery.of(context).size.width - 68) / 2,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryContainer
                : AppColors.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected
              ? AppColors.primaryContainer
              : Colors.transparent,
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ]
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.bodyMd.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected
                  ? AppColors.onPrimaryContainer
                  : AppColors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}