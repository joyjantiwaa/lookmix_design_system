import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class RightIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const RightIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Right Arrow (ลูกศรชี้ขวา)
    const String rightSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
      <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h14m-6 6l6-6m-6-6l6 6"/>
    </svg>
    ''';

    return Iconify(
      rightSvg,
      size: size,
      color: color,
    );
  }
}