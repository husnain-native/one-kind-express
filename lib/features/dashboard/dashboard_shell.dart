import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../core/widgets/lux_bottom_nav.dart';
import '../../theme/app_theme.dart';
import '../driver/driver_profile_screen.dart';
import '../orders/active_order_screen.dart';
import '../orders/all_orders_screen.dart';
import '../orders/order_history_screen.dart';
import 'home_screen.dart';

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    final pages = [
      const HomeScreen(),
      const ActiveOrderScreen(),
      const AllOrdersScreen(),
      const DriverProfileScreen(),
    ];

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 280),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: Container(
            key: ValueKey(_index),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF050505)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: r.wp(5),
                right: r.wp(5),
                top: r.hp(2),
              ),
              child: pages[_index],
            ),
          ),
        ),
      ),
      bottomNavigationBar: LuxBottomNav(
        currentIndex: _index,
        onTabSelected: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const SizedBox.shrink(),
    );
  }
}

