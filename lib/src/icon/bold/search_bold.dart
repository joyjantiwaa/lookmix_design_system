import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class SearchBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const SearchBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Search Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><g fill="none"><path fill="currentColor" d="M18 11a7 7 0 1 1-14 0a7 7 0 0 1 14 0"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="m20 20l-2-2"/></g></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}