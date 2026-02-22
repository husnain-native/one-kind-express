import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';
import '../../../theme/app_theme.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({super.key, required this.label});

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

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.icon, required this.label});

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
              style: TextStyle(fontSize: r.sp(13)),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoOptionTile extends StatelessWidget {
  const PhotoOptionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: r.wp(10),
        height: r.wp(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.06),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.gold, size: r.sp(22)),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: r.sp(14),
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: AppColors.textSecondary,
        size: r.sp(20),
      ),
    );
  }
}

class ProfileFormField extends StatelessWidget {
  const ProfileFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    return Padding(
      padding: EdgeInsets.only(bottom: r.hp(1.6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: r.sp(12),
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: r.hp(0.6)),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(fontSize: r.sp(14), color: AppColors.textPrimary),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, size: r.sp(20), color: AppColors.gold),
              filled: true,
              fillColor: Colors.white.withOpacity(0.04),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: AppColors.gold, width: 1.2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: r.wp(4),
                vertical: r.hp(1.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
