import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String src;
  final String alt;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius; // ✅ เพิ่มกลับเข้ามา

  const ImageWidget({
    super.key,
    required this.src,
    required this.alt,
    this.width,
    this.height,
    this.fit,
    this.borderRadius, // ✅ เพิ่มกลับเข้ามา
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: alt,
      child: ClipRRect(
        // ✅ ถ้าไม่ได้ส่ง borderRadius มา ให้เป็นเหลี่ยม (BorderRadius.zero) เหมือน React
        borderRadius: borderRadius ?? BorderRadius.zero, 
        child: Image.network(
          src,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          // จัดการเคสรูปพัง ให้โชว์ Alt Text ตามสไตล์ scss
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: width,
              height: height,
              color: const Color(0xFFF3F4F6), // สีพื้นหลังตอนรูปพัง
              alignment: Alignment.center,
              child: Text(
                alt,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
              ),
            );
          },
        ),
      ),
    );
  }
}