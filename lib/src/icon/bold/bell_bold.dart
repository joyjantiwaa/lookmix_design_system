import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class BellBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const BellBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Bell Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M21 19v1H3v-1l2-2v-6c0-3.1 2.03-5.83 5-6.71V4a2 2 0 0 1 2-2a2 2 0 0 1 2 2v.29c2.97.88 5 3.61 5 6.71v6zm-7 2a2 2 0 0 1-2 2a2 2 0 0 1-2-2"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}