import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../routes/app_routes.dart';
import 'widgets/glucose_card.dart';
import 'widgets/medication_card.dart';
import 'widgets/hydration_card.dart';
import 'widgets/emergency_card.dart';
import 'widgets/bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedNavIndex = 0;

  void _onNavTap(int index) {
    setState(() => _selectedNavIndex = index);

    // Navigation selon l'onglet sélectionné
    switch (index) {
      case 0:
      // Déjà sur le dashboard
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.history);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.analytics); // ✅ Onglet Analytics
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.alerts);     // ✅ Onglet Alerts
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.appSettings);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Top App Bar
                _buildTopAppBar(),
                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Welcome
                        Text(
                          'Good morning, Sarah',
                          style: AppTypography.headlineLgMobile.copyWith(
                            color: AppColors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Everything looks stable today.',
                          style: AppTypography.bodyMd.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Glucose Card
                        const GlucoseCard(),
                        const SizedBox(height: 16),
                        // Quick Add Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add, size: 20),
                            label: Text(
                              'LOG GLUCOSE',
                              style: AppTypography.labelBold.copyWith(
                                color: AppColors.onPrimary,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                              shadowColor: AppColors.primary.withValues(alpha: 0.3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Medication Card
                        const MedicationCard(),
                        const SizedBox(height: 16),
                        // Hydration Card
                        const HydrationCard(),
                        const SizedBox(height: 16),
                        // Emergency Card
                        const EmergencyCard(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Navigation avec Analytics et Alerts
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavBar(
              selectedIndex: _selectedNavIndex,
              onTap: _onNavTap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopAppBar() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.9),
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
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.2),
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
                          child: Icon(Icons.person, color: AppColors.primary),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'GlycoCare',
                style: AppTypography.headlineMd.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
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
                  ),
                ],
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.alerts);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
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
                      // Badge de notification
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}