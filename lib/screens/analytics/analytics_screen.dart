import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'widgets/glucose_chart.dart';        // ✅ Import GlucoseChart
import 'widgets/time_in_target_gauge.dart';  // ✅ Import TimeInTargetGauge
import 'widgets/stats_cards.dart';           // ✅ Import StatsCards
import 'widgets/weekly_bar_chart.dart';      // ✅ Import WeeklyBarChart

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  String _selectedPeriod = 'Today';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.9),
        elevation: 0.5,
        title: Text(
          'Analytics',
          style: AppTypography.headlineMd.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: AppColors.onSurfaceVariant,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.surfaceContainerHigh,
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAzrxcZYHotVH2ATgXQz7fEozY4Ew7Wo1ikt1stwx3r8MGl-_yp_yW2_4ZztRuEmdGSTbOu5_4lmfYuMNfyXXBYUvOrbpFHV3AhTTfRrGy6GvQ9Qg-RF-2eSzyNVz7-eNlHKvWxk9rQH52CLOuPcrKJaNIWnU1-hiirTeZqq8VLtD59PZIvb6hhoOUGjzz-InTH4fGH86-ShS7Xy-RQvO4E2kcQw8L4HtD1a6a285L9hv_D5QyIrOrTIfBi-KN7bNBFekzZhKzmobR7',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.person,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Glucose Chart + Time in Target
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: GlucoseChart(
                          selectedPeriod: _selectedPeriod,
                          onPeriodChanged: (period) {
                            setState(() => _selectedPeriod = period);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        flex: 1,
                        child: TimeInTargetGauge(percentage: 85),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    GlucoseChart(
                      selectedPeriod: _selectedPeriod,
                      onPeriodChanged: (period) {
                        setState(() => _selectedPeriod = period);
                      },
                    ),
                    const SizedBox(height: 16),
                    const TimeInTargetGauge(percentage: 85),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            // Weekly Summary + Stats
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: StatsCards(),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        flex: 2,
                        child: WeeklyBarChart(),
                      ),
                    ],
                  );
                }
                return const Column(
                  children: [
                    StatsCards(),
                    SizedBox(height: 16),
                    WeeklyBarChart(),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            // Export Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.picture_as_pdf),
                label: Text(
                  'Export PDF Report',
                  style: AppTypography.labelBold.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  elevation: 8,
                  shadowColor: AppColors.primary.withOpacity(0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}