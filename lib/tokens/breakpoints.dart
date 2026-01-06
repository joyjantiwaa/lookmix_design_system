import 'package:flutter/widgets.dart';

class Responsive {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static bool isMobile(BuildContext context) =>
      width(context) < Breakpoints.tablet;

  static bool isTablet(BuildContext context) =>
      width(context) >= Breakpoints.tablet &&
      width(context) < Breakpoints.laptop;

  static bool isLaptop(BuildContext context) =>
      width(context) >= Breakpoints.laptop &&
      width(context) < Breakpoints.desktop;

  static bool isDesktop(BuildContext context) =>
      width(context) >= Breakpoints.desktop;
}
