import 'package:flutter/material.dart';

import '../features/auth/login_screen.dart';
import '../features/dashboard/dashboard_shell.dart';
import '../features/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return _page(const SplashScreen());
    case AppRoutes.login:
      return _page(const LoginScreen());
    case AppRoutes.dashboard:
      return _page(const DashboardShell());
    default:
      return _page(const SplashScreen());
  }
}

PageRouteBuilder _page(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (_, animation, secondaryAnimation, widget) {
      final fade = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      final slideTween = Tween<Offset>(
        begin: const Offset(0, 0.02),
        end: Offset.zero,
      ).chain(
        CurveTween(curve: Curves.easeOutCubic),
      );

      return FadeTransition(
        opacity: fade,
        child: SlideTransition(
          position: animation.drive(slideTween),
          child: widget,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 420),
  );
}

