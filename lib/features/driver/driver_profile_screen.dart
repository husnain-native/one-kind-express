import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../core/widgets/lux_button.dart';
import '../../core/widgets/lux_card.dart';
import '../../theme/app_theme.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: r.hp(1)),
          Text(
            'Driver profile',
            style: TextStyle(
              fontSize: r.sp(20),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: r.hp(2.4)),
          Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(r.wp(1.4)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [AppColors.gold, Color(0xFFFFF3C0)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gold.withOpacity(0.35),
                        blurRadius: 24,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: SizedBox(
                      width: r.wp(28),
                      height: r.wp(28),
                      child: Image.asset(
                        'assets/images/profile.avif',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.white.withOpacity(0.06),
                          child: Icon(
                            Icons.person_rounded,
                            size: r.sp(48),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: r.hp(1.6)),
                Text(
                  'Alexander Pierce',
                  style: TextStyle(
                    fontSize: r.sp(18),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: r.hp(0.6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_rounded,
                        size: r.sp(16), color: AppColors.gold),
                    SizedBox(width: r.wp(1)),
                    Text(
                      '4.9 • Elite partner',
                      style: TextStyle(
                        fontSize: r.sp(12),
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: r.hp(2.4)),
          LuxCard(
            padding: EdgeInsets.symmetric(
              vertical: r.hp(1.6),
              horizontal: r.wp(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionLabel(label: 'Contact'),
                SizedBox(height: r.hp(0.8)),
                _InfoRow(
                  icon: Icons.phone_rounded,
                  label: '+1 202 555 0199',
                ),
                Divider(height: r.hp(1.6), color: Colors.white.withOpacity(0.08)),
                _InfoRow(
                  icon: Icons.badge_rounded,
                  label: 'Driver ID  LUX-8421',
                ),
                Divider(height: r.hp(1.6), color: Colors.white.withOpacity(0.08)),
                _InfoRow(
                  icon: Icons.email_rounded,
                  label: 'alexander@luxparcel.com',
                ),
              ],
            ),
          ),
          SizedBox(height: r.hp(1.6)),
          LuxCard(
            padding: EdgeInsets.symmetric(
              vertical: r.hp(1.6),
              horizontal: r.wp(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionLabel(label: 'Vehicle'),
                SizedBox(height: r.hp(0.8)),
                _InfoRow(
                  icon: Icons.local_shipping_rounded,
                  label: 'Mercedes Sprinter • Black',
                ),
                Divider(height: r.hp(1.6), color: Colors.white.withOpacity(0.08)),
                _InfoRow(
                  icon: Icons.numbers_rounded,
                  label: 'Plate LUX-4321',
                ),
              ],
            ),
          ),
          SizedBox(height: r.hp(2.4)),
          LuxButton(
            label: 'Edit profile',
            icon: Icons.edit_rounded,
            onPressed: () {},
          ),
          SizedBox(height: r.hp(1.4)),
          LuxButton(
            label: 'Logout',
            isOutlined: true,
            icon: Icons.logout_rounded,
            onPressed: () {},
          ),
          SizedBox(height: r.hp(4)),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    return Row(
      children: [
        Container(
          width: 24,
          height: 1,
          color: AppColors.gold,
        ),
        SizedBox(width: r.wp(2)),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: r.sp(10),
            color: AppColors.textSecondary,
            letterSpacing: 1.4,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: r.hp(0.8)),
      child: Row(
        children: [
          Container(
            width: r.wp(8),
            height: r.wp(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: r.sp(16), color: AppColors.gold),
          ),
          SizedBox(width: r.wp(3)),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: r.sp(13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
