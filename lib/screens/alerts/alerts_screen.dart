import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'widgets/emergency_card.dart';
import 'widgets/alert_card.dart';
import 'widgets/notification_toggle.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.9),
        elevation: 0.5,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.onPrimaryContainer,
              ),
            ),
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emergency Section
            const EmergencyCard(),
            const SizedBox(height: 32),
            // Active Alerts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Active Alerts',
                  style: AppTypography.headlineMd.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.errorContainer,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '4 Active',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.onErrorContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Critical Low Alert
            const AlertCard(
              type: AlertType.criticalLow,
              value: 65,
              title: 'Critical Low Glucose',
              message: 'Immediate sugar intake required. Monitoring vital signs.',
            ),
            const SizedBox(height: 12),
            // High Warning Alert
            const AlertCard(
              type: AlertType.highWarning,
              value: 210,
              title: 'High Glucose Warning',
            ),
            const SizedBox(height: 12),
            // Medication Reminder
            _buildMedicationReminder(),
            const SizedBox(height: 12),
            // System Alert
            _buildSystemAlert(),
            const SizedBox(height: 32),
            // Notification Settings
            Text(
              'Notification Settings',
              style: AppTypography.headlineMd.copyWith(
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            _buildNotificationSettings(),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationReminder() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.tertiaryFixed.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.tertiaryFixed),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.tertiaryContainer,
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Icon(
              Icons.medication,
              color: AppColors.onTertiaryContainer,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Insulin Dose Reminder',
                  style: AppTypography.bodyLg.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
                Text(
                  'Scheduled for 10:00 AM',
                  style: AppTypography.bodyMd.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.check_circle,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildSystemAlert() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.sync_problem,
            color: AppColors.outline,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Sensor sync failure. Check connection.',
              style: TextStyle(color: AppColors.onSurfaceVariant),
            ),
          ),
          Text(
            'RETRY',
            style: AppTypography.labelBold.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSettings() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          const NotificationToggle(
            icon: Icons.emergency,
            iconColor: AppColors.error,
            title: 'Critical Alerts',
            subtitle: 'Cannot be disabled for safety',
            isLocked: true,
            value: true,
          ),
          const Divider(height: 1, color: AppColors.outlineVariant),
          const NotificationToggle(
            icon: Icons.notifications_active,
            iconColor: AppColors.primary,
            title: 'High/Low Warnings',
            subtitle: 'Alert when outside target range',
            value: true,
          ),
          const Divider(height: 1, color: AppColors.outlineVariant),
          const NotificationToggle(
            icon: Icons.alarm,
            iconColor: AppColors.primary,
            title: 'Reminders',
            subtitle: 'Medication and testing prompts',
            value: true,
          ),
          const Divider(height: 1, color: AppColors.outlineVariant),
          const NotificationToggle(
            icon: Icons.sync,
            iconColor: AppColors.primary,
            title: 'Sync Alerts',
            subtitle: 'Sensor and app connection issues',
            value: false,
          ),
        ],
      ),
    );
  }
}