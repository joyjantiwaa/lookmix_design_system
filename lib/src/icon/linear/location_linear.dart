import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class LocationIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const LocationIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Location (Map Pin) ที่มีรายละเอียดรูเจาะ
    const String locationSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="1024" height="1024" viewBox="0 0 1024 1024">
      <path fill="currentColor" d="M800 416a288 288 0 1 0-576 0c0 118.144 94.528 272.128 288 456.576C705.472 688.128 800 534.144 800 416M512 960C277.312 746.688 160 565.312 160 416a352 352 0 0 1 704 0c0 149.312-117.312 330.688-352 544"/>
      <path fill="currentColor" d="M512 512a96 96 0 1 0 0-192a96 96 0 0 0 0 192m0 64a160 160 0 1 1 0-320a160 160 0 0 1 0 320"/>
    </svg>
    ''';

    return Iconify(
      locationSvg,
      size: size,
      color: color,
    );
  }
}