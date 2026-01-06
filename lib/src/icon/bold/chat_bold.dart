import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ChatBoldIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const ChatBoldIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // SVG Chat Bold ที่พี่ส่งมา
    const String svgData = '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 21a9 9 0 1 0-7.605-4.185L3 21l4.185-1.395A8.96 8.96 0 0 0 12 21"/></svg>''';

    return Iconify(
      svgData,
      size: size,
      color: color,
    );
  }
}