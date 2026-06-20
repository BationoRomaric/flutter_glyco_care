import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'widgets/reading_card.dart';
import 'widgets/segmented_control.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _selectedTimeframe = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.9),
        elevation: 0.5,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.menu, color: AppColors.primary),
        ),
        title: Text(
          'Glucose History',
          style: AppTypography.headlineMd.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.surfaceContainerHighest,
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAfY7enoc7wFm4E3RFpLsBGbrZZ9YNEFXRBCQa5vrOxFOcieaqDCodwnfN2z1SjkSvCdqNsNW3eEKuwrJDSi1HUmPzKO_UuGmdJnY_VttusyCo_iAg6m8r4JCLLpoEC0o1YLuzWEt0wuTJJGjRCDSfIxcr8gXwWSGYTBUVdfMk3hTSDjsE-HLFkFoYzekaK_vldR8ELLSLd0Q0N7gh28GLb46xf7HIrxsuCjUl4bNFdTzzkp2lymDSYX4L90f5qqRVdMUd194h3m2dL',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.person,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search & Filter
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search readings...',
                      hintStyle: AppTypography.bodyMd.copyWith(
                        color: AppColors.outline,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.outline,
                      ),
                      filled: true,
                      fillColor: AppColors.surfaceContainerLowest,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.outlineVariant,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.outlineVariant,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.outlineVariant),
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.surfaceContainerLowest,
                  ),
                  child: const Icon(
                    Icons.filter_list,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Segmented Control
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SegmentedControl(
              selected: _selectedTimeframe,
              options: const ['Daily', 'Weekly', 'Monthly'],
              onChanged: (value) {
                setState(() => _selectedTimeframe = value);
              },
            ),
          ),
          const SizedBox(height: 24),
          // Timeline
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildDateGroup(
                  'Today, May 24',
                  [
                    ReadingData(
                      label: 'Before Breakfast',
                      time: '08:30 AM',
                      value: 94,
                      status: ReadingStatus.normal,
                      icon: Icons.restaurant,
                    ),
                    ReadingData(
                      label: 'After Lunch',
                      time: '01:45 PM',
                      value: 142,
                      status: ReadingStatus.elevated,
                      icon: Icons.dinner_dining,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildDateGroup(
                  'Yesterday, May 23',
                  [
                    ReadingData(
                      label: 'Before Sleep',
                      time: '10:15 PM',
                      value: 198,
                      status: ReadingStatus.dangerous,
                      icon: Icons.bedtime,
                    ),
                    ReadingData(
                      label: 'Random Check',
                      time: '04:20 PM',
                      value: 110,
                      status: ReadingStatus.normal,
                      icon: Icons.monitor_heart, // ✅ Correction ici
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }

  Widget _buildDateGroup(String date, List<ReadingData> readings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              date,
              style: AppTypography.headlineMd.copyWith(
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Divider(color: AppColors.outlineVariant),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...readings.map((reading) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ReadingCard(data: reading),
        )),
      ],
    );
  }
}