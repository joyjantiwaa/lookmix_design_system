import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class UpIcon extends StatelessWidget {
  final double size;
  final Color? color;
  const UpIcon({super.key, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    const String svg = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M10.94 7.94a1.5 1.5 0 0 1 2.12 0l5.658 5.656a1.5 1.5 0 1 1-2.122 2.121L12 11.122l-4.596 4.596a1.5 1.5 0 1 1-2.122-2.12z"/></svg>''';
    return Iconify(svg, size: size, color: color);
  }
}