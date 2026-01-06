import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class DownBoldCircleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const DownBoldCircleIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Down Arrow in Circle Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 512 512"><path fill="currentColor" d="M464 256c0-114.87-93.13-208-208-208S48 141.13 48 256s93.13 208 208 208s208-93.13 208-208m-121.57-17.77l-74.13 89.09a16 16 0 0 1-24.6 0l-74.13-89.09A16 16 0 0 1 181.86 212h148.28a16 16 0 0 1 12.29 26.23"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}