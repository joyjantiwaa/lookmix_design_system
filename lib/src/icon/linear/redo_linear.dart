import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class RedoIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const RedoIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Redo (ลูกศรทำซ้ำ)
    const String redoSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
      <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 8h5V3m-.29 13.357a8 8 0 1 1-.19-8.991"/>
    </svg>
    ''';

    return Iconify(
      redoSvg,
      size: size,
      color: color,
    );
  }
}