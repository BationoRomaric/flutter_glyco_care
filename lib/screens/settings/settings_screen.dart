import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'widgets/profile_section.dart';
import 'widgets/settings_section.dart';
import 'widgets/preference_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.9),
        elevation: 0.5,
        title: Row(
          children: [
            ClipOval(
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAHRXLmK4AlCJHRethLG2hhODOiY_Ln299kfi65BLIFd2Cd-5gFH5UhcS8nEkoEGsXo1-HQGf6sye2EsyeKFuJyf-DHWyCOQOUtth_-3dvbjzq1nrIe6wVC7I1dH8_rJH44f0w_7xU0B0LysNRqfbGxRvxlYb0RCxHj10i5oauNuK1VmTHgJsijwqBtTOLPbICROVaWzW6yBxONoEaogxLGjYiXZkClRQPSGmCWchM10c2QvJpkHkfHkWHeVCggMl74xes-E0V0GraM',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 32,
                  height: 32,
                  color: AppColors.primaryContainer,
                  child: const Icon(Icons.person, size: 20),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Settings',
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
              Icons.account_circle,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Section
            const ProfileSection(),
            const SizedBox(height: 32),
            // Preferences Section
            const SettingsSection(
              icon: Icons.tune,
              title: 'Preferences',
              children: [
                PreferenceItem(
                  icon: Icons.dark_mode,
                  title: 'Appearance',
                  isToggle: true,
                  value: false,
                ),
                PreferenceItem(
                  icon: Icons.language,
                  title: 'Language',
                  trailing: 'English',
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Security & Privacy
            const SettingsSection(
              icon: Icons.shield,
              title: 'Security & Privacy',
              children: [
                PreferenceItem(
                  icon: Icons.fingerprint,
                  title: 'Biometric Authentication',
                  subtitle: 'Face ID / Touch ID',
                  isToggle: true,
                  value: true,
                ),
                PreferenceItem(
                  icon: Icons.pin,
                  title: 'PIN Protection',
                  showChevron: true,
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Encrypted Storage
            _buildEncryptionBanner(),
            const SizedBox(height: 32),
            // Data Section
            const SettingsSection(
              icon: Icons.storage, // ✅ Correction : Icons.database → Icons.storage
              title: 'Data',
              children: [],
            ),
            const SizedBox(height: 16),
            _buildExportButtons(),
            const SizedBox(height: 40),
            // Logout Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout),
                label: Text(
                  'Logout',
                  style: AppTypography.headlineMd.copyWith(
                    color: AppColors.error,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                  side: const BorderSide(color: AppColors.error),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'GlycoCare v2.4.0 (Stable Build)',
              style: AppTypography.caption.copyWith(
                color: AppColors.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEncryptionBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryContainer.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Icon(
              Icons.verified_user,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Encrypted Storage',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
                Text(
                  'AES-256 Active',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              'SECURE',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExportButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, size: 18),
            label: Text(
              'Export CSV',
              style: AppTypography.labelBold.copyWith(
                color: AppColors.primary,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.outlineVariant),
              minimumSize: const Size(0, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.picture_as_pdf, size: 18),
            label: Text(
              'Export PDF',
              style: AppTypography.labelBold.copyWith(
                color: AppColors.primary,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.outlineVariant),
              minimumSize: const Size(0, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}