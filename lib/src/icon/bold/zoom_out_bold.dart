import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ZoomOutBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const ZoomOutBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Zoom Out Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M14 3.072a8 8 0 0 1 2.617 11.424l4.944 4.943a1.5 1.5 0 0 1-2.008 2.225l-.114-.103l-4.943-4.944a8 8 0 0 1-12.49-6.332L2 10l.005-.285A8 8 0 0 1 14 3.072M13 9H7l-.117.007a1 1 0 0 0 0 1.986L7 11h6l.117-.007a1 1 0 0 0 0-1.986z"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}