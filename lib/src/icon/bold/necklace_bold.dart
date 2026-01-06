import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class NecklaceBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const NecklaceBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Necklace (สร้อยคอพร้อมจี้) Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="4"><path fill="currentColor" d="M17 32.41L24 29l7 3.41v7.5L24 44l-7-4.09z"/><path d="M8 4c.455 8.333 6 25 16 25S40 12.784 40 4"/></g></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}