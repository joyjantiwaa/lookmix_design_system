import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ExchangeBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const ExchangeBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Exchange Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M12.005 22.003c-5.523 0-10-4.477-10-10s4.477-10 10-10s10 4.477 10 10s-4.477 10-10 10m0-13h-4v2h9l-5-5zm-5 4l5 5v-3h4v-2z"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}