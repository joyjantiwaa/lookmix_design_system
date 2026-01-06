import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class EarphonesBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const EarphonesBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Earphone Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M12 4c-4.411 0-8 3.605-8 8.067V13h2a3 3 0 0 1 3 3v2a3 3 0 0 1-3 3H2v-8.933C2 6.514 6.47 2 12 2s10 4.514 10 10.067V21h-4a3 3 0 0 1-3-3v-2a3 3 0 0 1 3-3h2v-.933C20 7.605 16.411 4 12 4"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}