import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class LeftBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const LeftBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Left Arrow (Solid) Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="m4.431 12.822l13 9A1 1 0 0 0 19 21V3a1 1 0 0 0-1.569-.823l-13 9a1.003 1.003 0 0 0 0 1.645"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}