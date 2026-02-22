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

  static const int homeIndex = 0;
  static const int trackingIndex = 1;
  static const int gpsIndex = 2;
  static const int chatIndex = 3;
  static const int profileIndex = 4;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Container(
      padding: EdgeInsets.only(
        left: r.wp(6),
        right: r.wp(6),
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
            index: homeIndex,
            currentIndex: currentIndex,
            onTap: () => onTabSelected(homeIndex),
          ),
          _NavItem(
            icon: Icons.local_shipping_rounded,
            label: 'Tracking',
            index: trackingIndex,
            currentIndex: currentIndex,
            onTap: () => onTabSelected(trackingIndex),
          ),
          _GpsNavItem(
            isActive: currentIndex == gpsIndex,
            onTap: () => onTabSelected(gpsIndex),
          ),
          _NavItem(
            icon: Icons.chat_bubble_rounded,
            label: 'Chat',
            index: chatIndex,
            currentIndex: currentIndex,
            onTap: () => onTabSelected(chatIndex),
          ),
          _NavItem(
            icon: Icons.person_rounded,
            label: 'Profile',
            index: profileIndex,
            currentIndex: currentIndex,
            onTap: () => onTabSelected(profileIndex),
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
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  bool get isActive => currentIndex == index;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isActive
              ? _GoldCircle(
                  child: Icon(icon, size: r.sp(20), color: AppColors.black),
                )
              : Icon(icon, size: r.sp(20), color: AppColors.textSecondary),
          if (!isActive) ...[
            SizedBox(height: r.hp(0.3)),
            Text(
              label,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: r.sp(10),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _GpsNavItem extends StatelessWidget {
  const _GpsNavItem({
    required this.isActive,
    required this.onTap,
  });

  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isActive
              ? _GoldCircle(
                  child: Icon(
                    Icons.gps_fixed_rounded,
                    size: r.sp(20),
                    color: AppColors.black,
                  ),
                )
              : Icon(
                  Icons.gps_fixed_rounded,
                  size: r.sp(20),
                  color: AppColors.textSecondary,
                ),
          if (!isActive) ...[
            SizedBox(height: r.hp(0.3)),
            Text(
              'GPS',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: r.sp(10),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _GoldCircle extends StatelessWidget {
  const _GoldCircle({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Container(
      width: r.wp(16),
      height: r.wp(16),
      decoration: const BoxDecoration(
        color: AppColors.gold,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
