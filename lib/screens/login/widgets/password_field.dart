import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({
    super.key,
    required this.controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant),
        color: AppColors.surfaceContainerLowest,
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: '••••••••',
          hintStyle: AppTypography.bodyMd.copyWith(
            color: AppColors.outline,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 12, right: 8),
            child: Icon(
              Icons.lock_outline,
              color: AppColors.outline,
              size: 20,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 24,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12, left: 8),
            child: GestureDetector(
              onTap: () => setState(() => _obscureText = !_obscureText),
              child: Icon(
                _obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.outline,
                size: 20,
              ),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 24,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        style: AppTypography.bodyMd.copyWith(
          color: AppColors.onBackground,
        ),
      ),
    );
  }
}