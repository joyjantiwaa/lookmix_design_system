import 'package:flutter/widgets.dart';

// ✅ เพิ่มคลาสนี้เข้าไปเพื่อเก็บค่าตัวเลข
class Breakpoints {
  static const double mobile = 480;
  static const double tablet = 768;
  static const double laptop = 1024;
  static const double desktop = 1440;
}

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