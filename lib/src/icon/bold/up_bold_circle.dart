import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class UpBoldCircleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const UpBoldCircleIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Up Arrow in Circle Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 512 512"><path fill="currentColor" d="M256 48C141.13 48 48 141.13 48 256s93.13 208 208 208s208-93.13 208-208S370.87 48 256 48m74.14 252H181.86a16 16 0 0 1-12.29-26.23l74.13-89.09a16 16 0 0 1 24.6 0l74.13 89.09A16 16 0 0 1 330.14 300"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}