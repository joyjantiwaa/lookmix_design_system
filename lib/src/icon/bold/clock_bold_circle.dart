import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ClockBoldCircleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const ClockBoldCircleIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Clock Circle Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M12 0a12 12 0 1 0 12 12A12 12 0 0 0 12 0m5.2 17.22a1 1 0 0 1-1.42.06l-5-4.54a1 1 0 0 1-.28-.74V6.5a1 1 0 0 1 2 0v5.06l4.63 4.25a1 1 0 0 1 .07 1.41"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}