import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color gold = Color(0xFFE8B417);
  static const Color black = Colors.black;
  static const Color bgDark = Color(0xFF050505);
  static const Color bgCard = Color(0xFF111111);
  static const Color bgElevated = Color(0xFF181818);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF39C12);
  static const Color danger = Color(0xFFE74C3C);
}

ThemeData buildAppTheme() {
  final base = ThemeData.dark(useMaterial3: true);

  final cardTheme = CardThemeData(
    color: AppColors.bgCard.withOpacity(0.9),
    elevation: 12,
    shadowColor: AppColors.gold.withOpacity(0.35),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22),
    ),
  );

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.gold,
      secondary: AppColors.black,
      background: AppColors.bgDark,
    ),
    scaffoldBackgroundColor: AppColors.bgDark,
    textTheme: GoogleFonts.interTextTheme(
      base.textTheme,
    ).apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: cardTheme,
    useMaterial3: true,
  );
}

class Shadows {
  static List<BoxShadow> softGoldGlow = [
    BoxShadow(
      color: AppColors.gold.withOpacity(0.28),
      blurRadius: 24,
      spreadRadius: 1,
      offset: const Offset(0, 14),
    ),
  ];
}