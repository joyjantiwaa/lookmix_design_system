import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class PlusIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const PlusIcon({
    super.key, 
    this.size = 24, 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // รหัส SVG Plus Circle (เครื่องหมายบวกในวงกลม)
    const String plusSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
      <path fill="currentColor" d="M12 20c-4.41 0-8-3.59-8-8s3.59-8 8-8s8 3.59 8 8s-3.59 8-8 8m0-18A10 10 0 0 0 2 12a10 10 0 0 0 10 10a10 10 0 0 0 10-10A10 10 0 0 0 12 2m1 5h-2v4H7v2h4v4h2v-4h4v-2h-4z"/>
    </svg>
    ''';

    return Iconify(
      plusSvg,
      size: size,
      color: color,
    );
  }
}