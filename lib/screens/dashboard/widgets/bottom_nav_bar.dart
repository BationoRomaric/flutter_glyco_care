import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _items = const [
    _NavItem(icon: Icons.home, label: 'Home'),
    _NavItem(icon: Icons.history, label: 'History'),
    _NavItem(icon: Icons.analytics, label: 'Analytics'),
    _NavItem(icon: Icons.notifications, label: 'Alerts'),
    _NavItem(icon: Icons.settings, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.9),
        border: const Border(
          top: BorderSide(
            color: AppColors.outlineVariant,
            width: 0.5,
          ),
        ),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (index) {
          final isSelected = widget.selectedIndex == index;
          return _buildNavItem(_items[index], index, isSelected);
        }),
      ),
    );
  }

  Widget _buildNavItem(_NavItem item, int index, bool isSelected) {
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.icon,
              color: isSelected
                  ? AppColors.onPrimaryContainer
                  : AppColors.onSurfaceVariant,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: AppTypography.caption.copyWith(
                color: isSelected
                    ? AppColors.onPrimaryContainer
                    : AppColors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({
    required this.icon,
    required this.label,
  });
}