import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class DashboardTopAppBar extends StatelessWidget {
  const DashboardTopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.9),
        border: const Border(
          bottom: BorderSide(
            color: AppColors.outlineVariant,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo and Title
          Row(
            children: [
              _buildAvatar(),
              const SizedBox(width: 12),
              Text(
                'GlycoCare',
                style: AppTypography.headlineMd.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          // Right side actions
          Row(
            children: [
              _buildSyncStatus(),
              const SizedBox(width: 8),
              _buildNotificationButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: Image.network(
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD-IQve8w5Vstn_OHW6EfUoOQVUzlh-sff6eucVjlGDXEh5bPhc5nTA-5genM0APtVvVmpIJ_oIM_fQsjbkLa8lhjFgKwmtWA0DLFgz7DQNGdJn1PMdZ_qxTZMw4YYHrSBh5UDR0daaP17t1cwdB3P7rIjNG21dqHnVIvzjhIEtHHNAq7uULEUkCQq6eFJmzFDrvyJaJt56G7JgzXKLhr_nCMtV5cGVndsgEyWx7kdK7T591oWZtt3tkzWeWqakmccUTRtyLjp-0SNl',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.primaryFixed,
              child: const Center(
                child: Icon(
                  Icons.person,
                  color: AppColors.primary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSyncStatus() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.sync,
          size: 14,
          color: AppColors.onSurfaceVariant,
        ),
        const SizedBox(width: 4),
        Text(
          'Last synced: Just now',
          style: AppTypography.caption.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: AppColors.surfaceContainerHigh.withOpacity(0.5),
      ),
      child: Stack(
        children: [
          const Center(
            child: Icon(
              Icons.notifications_outlined,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          // Notification badge
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}