import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class EditBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const EditBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Edit Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M7.243 17.997H3v-4.243L14.435 2.319a1 1 0 0 1 1.414 0l2.829 2.828a1 1 0 0 1 0 1.415zm-4.243 2h18v2H3z"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}