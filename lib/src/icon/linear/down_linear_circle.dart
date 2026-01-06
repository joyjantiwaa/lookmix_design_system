import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class DownLinearCircleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const DownLinearCircleIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG data ที่พี่ให้มา (ลูกศรชี้ลงในวงกลม)
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48"><g fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="4"><path d="M24 44c11.046 0 20-8.954 20-20S35.046 4 24 4S4 12.954 4 24s8.954 20 20 20Z"/><path stroke-linecap="round" d="m33 21l-9 9l-9-9"/></g></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}