import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class UpBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const UpBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Up Arrow / Chevron Up Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48"><path fill="currentColor" stroke="currentColor" stroke-linejoin="round" stroke-width="4" d="m12 29l12-12l12 12z"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}