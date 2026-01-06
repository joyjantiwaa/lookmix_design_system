import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class FemaleIcon extends StatelessWidget {
  final double size;
  final Color? color;
  const FemaleIcon({super.key, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    const String svg = '''<svg xmlns="http://www.w3.org/2000/svg" width="256" height="256" viewBox="0 0 256 256"><path fill="currentColor" d="M200 104a72 72 0 1 0-80 71.54V200h-24a8 8 0 0 0 0 16h24v16a8 8 0 0 0 16 0v-16h24a8 8 0 0 0 0-16h-24v-24.46A72.11 72.11 0 0 0 200 104m-128 0a56 56 0 1 1 56 56a56.06 56.06 0 0 1-56-56"/></svg>''';
    return Iconify(svg, size: size, color: color);
  }
}