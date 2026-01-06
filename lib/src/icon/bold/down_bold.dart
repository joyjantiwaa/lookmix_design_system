import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class DownBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const DownBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Down Arrow (Solid) Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="1024" height="1344" viewBox="0 0 1024 1344"><g transform="translate(0 1344) scale(1 -1)"><path fill="currentColor" d="M1024 512q0 26-19 45t-45 19H64q-26 0-45-19T0 512t19-45L467 19q19-19 45-19t45 19l448 448q19 19 19 45"/></g></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}