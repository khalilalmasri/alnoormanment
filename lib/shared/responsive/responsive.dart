import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}

class ResponsiveScreenSize<T> {
  static bool isXSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < 576;

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < 768 &&
      MediaQuery.of(context).size.width > 576;

  static bool isMedium(BuildContext context) =>
      MediaQuery.of(context).size.width < 992 &&
      MediaQuery.of(context).size.width > 768;

  static bool isLarge(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width > 992;

  static bool isXLarge(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;

  static double? getObjectValueFromScreenSize(
      BuildContext context, List<double> list) {
    if (list.length != 5) return null;

    if (ResponsiveScreenSize.isXSmall(context)) {
      return list.elementAt(0);
    } else if (ResponsiveScreenSize.isSmall(context)) {
      return list.elementAt(1);
    } else if (ResponsiveScreenSize.isMedium(context)) {
      return list.elementAt(2);
    } else if (ResponsiveScreenSize.isLarge(context)) {
      return list.elementAt(3);
    } else {
      return list.elementAt(4);
    }
  }
}