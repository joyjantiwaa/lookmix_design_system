import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class UserIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const UserIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG User (โปรไฟล์ผู้ใช้)
    const String userSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
      <path fill="currentColor" d="M12 2a5 5 0 1 0 5 5a5 5 0 0 0-5-5m0 8a3 3 0 1 1 3-3a3 3 0 0 1-3 3m9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"/>
    </svg>
    ''';

    return Iconify(
      userSvg,
      size: size,
      color: color,
    );
  }
}