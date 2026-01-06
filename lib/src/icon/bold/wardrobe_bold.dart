import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class WardrobeBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const WardrobeBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Wardrobe (ตู้เสื้อผ้า) Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M4 4v15c0 1.1.9 2 2 2v1h2v-1h3.5V2H6c-1.1 0-2 .9-2 2m4 6h2v3H8zm10-8h-5.5v19H16v1h2v-1c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2m-2 11h-2v-3h2z"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}