import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../utils/responsive.dart';

class LuxCard extends StatelessWidget {
  const LuxCard({
    super.key,
    required this.child,
    this.onTap,
    this.gradient,
    this.padding,
    this.borderColor,
    this.borderWidth,
  });

  final Widget child;
  final VoidCallback? onTap;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    final content = Container(
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: r.hp(2),
            horizontal: r.wp(4),
          ),
      decoration: BoxDecoration(
        gradient: gradient ??
            const LinearGradient(
              colors: [
                Color(0xFF141414),
                Color(0xFF050505),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: Shadows.softGoldGlow,
        border: Border.all(
          color: borderColor ?? Colors.white.withOpacity(0.03),
          width: borderWidth ?? 1,
        ),
      ),
      child: child,
    );

    if (onTap == null) return content;

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: content,
    );
  }
}

