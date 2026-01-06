import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class SaveBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const SaveBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Save (Floppy Disk) Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M21 7v12q0 .825-.587 1.413T19 21H5q-.825 0-1.412-.587T3 19V5q0-.825.588-1.412T5 3h12zm-9 11q1.25 0 2.125-.875T15 15t-.875-2.125T12 12t-2.125.875T9 15t.875 2.125T12 18m-6-8h9V6H6z"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}