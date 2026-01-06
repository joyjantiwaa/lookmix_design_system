import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class TrashBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const TrashBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Trash / Delete Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M19 4h-3.5l-1-1h-5l-1 1H5v2h14M6 19a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V7H6z"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}