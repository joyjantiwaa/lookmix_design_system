import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class MicBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const MicBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Microphone Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 28 28"><path fill="currentColor" d="M14 2a4.5 4.5 0 0 0-4.5 4.5v8a4.5 4.5 0 1 0 9 0v-8A4.5 4.5 0 0 0 14 2M7.5 13.75a.75.75 0 1 0-1.5 0v.75a8 8 0 0 0 7.25 7.965v2.785a.75.75 0 0 0 1.5 0v-2.785A8 8 0 0 0 22 14.5v-.75a.75.75 0 1 0-1.5 0v.75a6.5 6.5 0 1 1-13 0z"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}