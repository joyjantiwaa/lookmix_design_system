import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class RightBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const RightBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Right Arrow (Solid) Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M5.536 21.886a1 1 0 0 0 1.033-.064l13-9a1 1 0 0 0 0-1.644l-13-9A1 1 0 0 0 5 3v18a1 1 0 0 0 .536.886"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}