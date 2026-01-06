import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class WardrobeIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const WardrobeIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Wardrobe (ตู้เสื้อผ้า)
    const String wardrobeSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
      <path fill="currentColor" d="M6 2a2 2 0 0 0-2 2v15c0 1.11.89 2 2 2v1h2v-1h8v1h2v-1c1.11 0 2-.89 2-2V4a2 2 0 0 0-2-2zm0 2h5v15H6zm7 0h5v15h-5zm-5 6v3h2v-3zm6 0v3h2v-3z"/>
    </svg>
    ''';

    return Iconify(
      wardrobeSvg,
      size: size,
      color: color,
    );
  }
}