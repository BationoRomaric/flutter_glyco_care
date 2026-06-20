import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class SyncButton extends StatelessWidget {
  final bool isSyncing;
  final String lastSync;
  final VoidCallback onSync;

  const SyncButton({
    super.key,
    required this.isSyncing,
    required this.lastSync,
    required this.onSync,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: isSyncing ? null : onSync,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 192,
            height: 192,
            decoration: BoxDecoration(
              color: isSyncing ? AppColors.secondary : AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (isSyncing ? AppColors.secondary : AppColors.primary)
                      .withOpacity(0.2),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedRotation(
                  turns: isSyncing ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: Icon(
                    Icons.sync,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isSyncing ? 'Syncing...' : 'Sync Now',
                  style: AppTypography.headlineMd.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Last synced: $lastSync',
          style: AppTypography.bodyMd.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 16),
            SizedBox(width: 8),
            Text(
              'All datasets up to date',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}