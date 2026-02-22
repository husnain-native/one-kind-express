import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../core/widgets/lux_card.dart';
import '../../theme/app_theme.dart';

class GpsScreen extends StatelessWidget {
  const GpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: r.hp(1)),
        Text(
          'GPS',
          style: TextStyle(
            fontSize: r.sp(20),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: r.hp(1)),
        Text(
          'Live location & navigation',
          style: TextStyle(
            fontSize: r.sp(12),
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: r.hp(3)),
        LuxCard(
          padding: EdgeInsets.symmetric(
            vertical: r.hp(4),
            horizontal: r.wp(5),
          ),
          child: Column(
            children: [
              Icon(
                Icons.gps_fixed_rounded,
                size: r.sp(48),
                color: AppColors.gold,
              ),
              SizedBox(height: r.hp(2)),
              Text(
                'GPS view',
                style: TextStyle(
                  fontSize: r.sp(16),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: r.hp(1)),
              Text(
                'Map and live tracking will appear here when connected.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: r.sp(12),
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
