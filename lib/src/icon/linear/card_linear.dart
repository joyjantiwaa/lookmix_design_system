import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CardIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const CardIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Card ที่คุณให้มา (สไตล์ Outline ทันสมัย)
    const String cardSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 512 512">
      <rect width="416" height="320" x="48" y="96" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" rx="56" ry="56"/>
      <path fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="60" d="M48 192h416M128 300h48v20h-48z"/>
    </svg>
    ''';

    return Iconify(
      cardSvg,
      size: size,
      color: color,
    );
  }
}