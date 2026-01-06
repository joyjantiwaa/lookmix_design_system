import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class UndoIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const UndoIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Undo (ลูกศรย้อนกลับ)
    const String undoSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
      <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 8H5V3m.291 13.357a8 8 0 1 0 .188-8.991"/>
    </svg>
    ''';

    return Iconify(
      undoSvg,
      size: size,
      color: color,
    );
  }
}