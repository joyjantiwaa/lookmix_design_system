import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // ✅ เรียกใช้ SVG

class Logo extends StatelessWidget {
  final String name;
  final String? slogan;
  final String? href;
  final double size;
  final Widget? logo;
  final bool minimal;
  final EdgeInsets? padding;

  const Logo({
    super.key, // ใช้ super.key แบบสั้นตาม Flutter 3.x
    this.name = 'LOOKMIX',
    this.slogan,
    this.href,
    this.size = 39,
    this.logo,
    this.minimal = false,
    this.padding,
  });

  void _handleTap(BuildContext context) {
    if (href != null) {
      debugPrint('Navigating to: $href');
      // พี่สามารถใช้ url_launcher ในอนาคตได้
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ส่วนของรูป Logo
        ClipRRect(
          borderRadius: BorderRadius.circular(size / 2),
          child: SizedBox(
            width: size,
            height: size,
            child: logo ?? _defaultLogo(size),
          ),
        ),
        
        // ส่วนของชื่อและสโลแกน (แสดงเมื่อไม่ใช่ minimal)
        if (!minimal)
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    // ✅ แก้เป็น bodyLarge เพื่อไม่ให้ Error
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                if (slogan != null)
                  Text(
                    slogan!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      // ✅ แก้เป็น bodyMedium เพื่อไม่ให้ Error
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );

    return GestureDetector(
      onTap: href != null ? () => _handleTap(context) : null,
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        color: Colors.transparent,
        child: content,
      ),
    );
  }

  // ✅ ฟังชันก์เรียกใช้ SVG Logo ที่พี่เพิ่มเข้า Assets
  Widget _defaultLogo(double size) {
    return SvgPicture.asset(
      'assets/logos/Lookmixlogo.svg',
      width: size,
      height: size,
      fit: BoxFit.contain,
      // กรณีหาไฟล์ไม่เจอ ให้โชว์ตัวอักษรแทน (กัน App พัง)
      placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue,
        child: const Center(
          child: Text('L', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
} 