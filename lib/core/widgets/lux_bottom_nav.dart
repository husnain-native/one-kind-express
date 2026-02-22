import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../utils/responsive.dart';

class LuxBottomNav extends StatelessWidget {
  const LuxBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Container(
      padding: EdgeInsets.only(
        left: r.wp(8),
        right: r.wp(8),
        bottom: r.hp(1.4) + MediaQuery.viewPaddingOf(context).bottom,
        top: r.hp(1.2),
      ),
      decoration: const BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(
            icon: Icons.home_rounded,
            label: 'Home',
            isActive: currentIndex == 0,
            onTap: () => onTabSelected(0),
          ),
          _NavItem(
            icon: Icons.local_shipping_rounded,
            label: 'Tracking',
            isActive: currentIndex == 1,
            onTap: () => onTabSelected(1),
          ),
          _CentralFab(
            onTap: () => onTabSelected(1),
          ),
          _NavItem(
            icon: Icons.chat_bubble_rounded,
            label: 'Chat',
            isActive: currentIndex == 2,
            onTap: () => onTabSelected(2),
          ),
          _NavItem(
            icon: Icons.person_rounded,
            label: 'Profile',
            isActive: currentIndex == 3,
            onTap: () => onTabSelected(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    final color = isActive ? AppColors.gold : AppColors.textSecondary;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: r.sp(20), color: color),
          SizedBox(height: r.hp(0.3)),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: r.sp(10),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _CentralFab extends StatelessWidget {
  const _CentralFab({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: r.wp(16),
        height: r.wp(16),
        decoration: const BoxDecoration(
          color: AppColors.gold,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.near_me_rounded,
          size: r.sp(22),
          color: AppColors.black,
        ),
      ),
    );
  }
}

