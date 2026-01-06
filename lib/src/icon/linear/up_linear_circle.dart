import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class UpCircleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const UpCircleIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Up Circle (ลูกศรชี้ขึ้นในวงกลม)
    const String upSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48">
      <g fill="none" stroke="currentColor" stroke-width="4">
        <circle cx="24" cy="24" r="20" />
        <path stroke-linecap="round" stroke-linejoin="round" d="m33 27l-9-9l-9 9"/>
      </g>
    </svg>
    ''';

    return Iconify(
      upSvg,
      size: size,
      color: color,
    );
  }
}