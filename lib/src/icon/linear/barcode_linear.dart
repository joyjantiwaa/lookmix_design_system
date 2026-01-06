import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class BarcodeLinearIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const BarcodeLinearIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // ใช้รหัส SVG Barcode ที่คุณให้มา
    const String barcodeSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
      <path fill="currentColor" fill-rule="evenodd" d="M2 6h1v12H2zm2 0h2v12H4zm4 0h1v12H8zm2 0h3v12h-3zm4 0h1v12h-1zm3 0h1v12h-1zm2 0h1v12h-1zm2 0h1v12h-1z"/>
    </svg>
    ''';

    return Iconify(
      barcodeSvg,
      size: size,
      color: color,
    );
  }
}