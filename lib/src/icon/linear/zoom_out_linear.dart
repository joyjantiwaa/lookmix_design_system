import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ZoomOutIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const ZoomOutIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Zoom Out (แว่นขยายเครื่องหมายลบ)
    const String zoomOutSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
      <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10a7 7 0 1 0 14 0a7 7 0 1 0-14 0m4 0h6m8 11l-6-6"/>
    </svg>
    ''';

    return Iconify(
      zoomOutSvg,
      size: size,
      color: color,
    );
  }
}