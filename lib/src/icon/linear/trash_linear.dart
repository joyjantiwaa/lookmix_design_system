import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class TrashIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const TrashIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Trash (ถังขยะสำหรับลบข้อมูล)
    const String trashSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
      <path fill="currentColor" d="M6 19a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V7H6zM8 9h8v10H8zm7.5-5l-1-1h-5l-1 1H5v2h14V4z"/>
    </svg>
    ''';

    return Iconify(
      trashSvg,
      size: size,
      color: color,
    );
  }
}