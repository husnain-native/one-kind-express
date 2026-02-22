import 'package:flutter/material.dart';

import 'routing/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const LuxParcelApp());
}

class LuxParcelApp extends StatelessWidget {
  const LuxParcelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lux Parcel',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRoutes.splash,
    );
  }
}

