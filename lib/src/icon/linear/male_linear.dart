import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class MaleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const MaleIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Male Icon ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" fill-rule="evenodd" d="M13.75 3.75a1 1 0 1 0 0 2h3.106l-2.924 2.965A7.001 7.001 0 0 0 4.734 19.23a7 7 0 0 0 10.599-9.085l2.917-2.96V9.75a1 1 0 1 0 2 0v-6zM6.148 17.815a5 5 0 1 0 7.071-7.071a5 5 0 0 0-7.07 7.07" clip-rule="evenodd"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}