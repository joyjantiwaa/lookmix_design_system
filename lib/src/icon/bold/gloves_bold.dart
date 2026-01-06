import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class GlovesBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const GlovesBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Gloves Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48"><path fill="currentColor" fill-rule="evenodd" d="M24 6.5a1.5 1.5 0 0 1 3 0V19h1V8.5a1.5 1.5 0 0 1 3 0V24l2.923-3.653a1.881 1.881 0 0 1 3.034 2.218l-4.25 6.374a9.1 9.1 0 0 1-3.616 3.15L30 43H18l.905-10.859A6 6 0 0 1 16 27V10.5a1.5 1.5 0 0 1 3 0V19h1V8.5a1.5 1.5 0 0 1 3 0V19h1zM12 12h2v16c0 1.85 1.092 3.784 2.517 4.644l.544.328L16.216 41h-2.011l.738-7.011C13.181 32.647 12 30.286 12 28z" clip-rule="evenodd"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}