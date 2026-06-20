import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'widgets/sync_button.dart';
import 'widgets/security_card.dart'; // ✅ Import de SecurityCard
import 'widgets/provider_card.dart';

class SyncScreen extends StatefulWidget {
  const SyncScreen({super.key});

  @override
  State<SyncScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends State<SyncScreen> {
  bool _isSyncing = false;
  String _lastSync = '2 minutes ago';

  void _handleSync() {
    setState(() => _isSyncing = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isSyncing = false;
          _lastSync = 'just now';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.9),
        elevation: 0.5,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        title: Text(
          'Data Synchronization',
          style: AppTypography.headlineMd.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_outline,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Connection Status
            _buildConnectionStatus(),
            const SizedBox(height: 32),
            // Sync Button
            SyncButton(
              isSyncing: _isSyncing,
              lastSync: _lastSync,
              onSync: _handleSync,
            ),
            const SizedBox(height: 32),
            // Security & Offline Cards
            Row(
              children: [
                const Expanded(child: SecurityCard()), // ✅ SecurityCard est maintenant reconnu
                const SizedBox(width: 16),
                const Expanded(child: _OfflineSyncCard()),
              ],
            ),
            const SizedBox(height: 32),
            // Integrated Providers
            _buildProvidersSection(),
            const SizedBox(height: 32),
            // Recent Activity
            _buildRecentActivity(),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionStatus() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Icon(
                  Icons.cloud_sync,
                  color: AppColors.onSecondaryContainer,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.surfaceContainerLowest,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Interoperability Protocol',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'FHIR Server: Connected',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProvidersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Integrated Providers',
              style: AppTypography.headlineMd.copyWith(
                color: AppColors.onSurface,
              ),
            ),
            Text(
              'Manage Connections',
              style: AppTypography.labelBold.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ProviderCard(
                name: 'Mayo Clinic',
                lastSync: 'Today, 08:30 AM',
                isActive: true,
              ),
              SizedBox(width: 16),
              ProviderCard(
                name: 'Cleveland Clinic',
                lastSync: 'Yesterday, 11:45 PM',
                isActive: true,
              ),
              SizedBox(width: 16),
              ProviderCard(
                name: 'Add Provider',
                lastSync: 'Connect new FHIR gateway',
                isActive: false,
                isAddNew: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: AppTypography.headlineMd.copyWith(
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            children: [
              _buildActivityItem(
                icon: Icons.check,
                iconColor: Colors.green,
                title: 'Glucose Bundle Upload',
                subtitle: '14 Resources • Success',
                time: '2 mins ago',
              ),
              const Divider(height: 1, color: AppColors.outlineVariant),
              _buildActivityItem(
                icon: Icons.check,
                iconColor: Colors.green,
                title: 'Observation Fetch',
                subtitle: 'Mayo Clinic • Success',
                time: 'Today, 08:30 AM',
              ),
              const Divider(height: 1, color: AppColors.outlineVariant),
              _buildActivityItem(
                icon: Icons.refresh,
                iconColor: AppColors.primary,
                title: 'Background Metadata Sync',
                subtitle: 'System • Success',
                time: 'Today, 04:12 AM',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.labelBold.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: AppTypography.caption.copyWith(
              color: AppColors.outline,
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Widget OfflineSyncCard (renommé pour éviter conflit)
class _OfflineSyncCard extends StatelessWidget {
  const _OfflineSyncCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.wifi_off, color: AppColors.secondary, size: 20),
              const SizedBox(width: 8),
              Text(
                'Offline Synchronization',
                style: AppTypography.labelBold.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'You have 14 cached records ready for sync when connection is restored.',
            style: AppTypography.bodyMd.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 1.0,
              backgroundColor: AppColors.surfaceContainer,
              color: AppColors.secondary,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Queue: 100% locally saved',
            style: AppTypography.caption.copyWith(
              color: AppColors.outline,
            ),
          ),
        ],
      ),
    );
  }
}