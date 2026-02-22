import 'package:flutter/material.dart';

class Responsive {
  Responsive(this.context)
      : size = MediaQuery.sizeOf(context),
        padding = MediaQuery.viewPaddingOf(context);

  final BuildContext context;
  final Size size;
  final EdgeInsets padding;

  double wp(double percent) => size.width * percent / 100;

  double hp(double percent) => size.height * percent / 100;

  double sp(double sizePx) {
    final shortestSide = size.shortestSide;
    if (shortestSide >= 900) return sizePx * 1.4; // tablets
    if (shortestSide >= 600) return sizePx * 1.2; // large phones
    return sizePx;
  }

  EdgeInsets get safePadding =>
      EdgeInsets.only(top: padding.top, bottom: padding.bottom);
}

