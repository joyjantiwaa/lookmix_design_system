import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class EyeglassesBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const EyeglassesBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Eyeglasses Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="256" height="256" viewBox="0 0 256 256"><path fill="currentColor" d="M232 72v92a44 44 0 0 1-87.81 4h-32.38A44 44 0 0 1 24 164V72a32 32 0 0 1 32-32a8 8 0 0 1 0 16a16 16 0 0 0-16 16v58.08A44 44 0 0 1 110.32 152h35.36A44 44 0 0 1 216 130.08V72a16 16 0 0 0-16-16a8 8 0 0 1 0-16a32 32 0 0 1 32 32"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}