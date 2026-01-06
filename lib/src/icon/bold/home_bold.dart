import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class HomeBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const HomeBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Home Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M4 19v-9q0-.475.213-.9t.587-.7l6-4.5q.525-.4 1.2-.4t1.2.4l6 4.5q.375.275.588.7T20 10v9q0 .825-.588 1.413T18 21h-3q-.425 0-.712-.288T14 20v-5q0-.425-.288-.712T13 14h-2q-.425 0-.712.288T10 15v5q0 .425-.288.713T9 21H6q-.825 0-1.412-.587T4 19"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}