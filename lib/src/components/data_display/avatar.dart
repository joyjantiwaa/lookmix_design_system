import 'package:flutter/material.dart';
// ✅ นำเข้า Tokens เพื่อใช้สีและรัศมีที่กำหนดไว้ใน Design System
import '../../../tokens/tokens.dart'; 

enum AvatarSize { sm, md, lg }
enum AvatarShape { circle, square }

class Avatar extends StatelessWidget {
  final String? src; 
  final String? alt; 
  final String? name; 
  final dynamic size; // รับได้ทั้ง AvatarSize หรือ double
  final AvatarShape shape;
  
  const Avatar({
    super.key, // ใช้ super.key แบบใหม่
    this.src,
    this.alt,
    this.name,
    this.size = AvatarSize.md,
    this.shape = AvatarShape.circle,
  });

  // ✅ คำนวณขนาดตัวเลข
  double _getSizeValue() {
    if (size is double) return size;
    switch (size) {
      case AvatarSize.sm: return 32.0;
      case AvatarSize.md: return 48.0;
      case AvatarSize.lg: return 64.0;
      default: return 48.0;
    }
  }

  // ✅ ดึงอักษรย่อจากชื่อ
  String? _getInitials() {
    if (name == null || name!.trim().isEmpty) return null;
    List<String> parts = name!.trim().split(' ');
    if (parts.length > 1) {
      return (parts[0][0] + parts[1][0]).toUpperCase(); // คืนค่า 2 ตัวแรกถ้ามีนามสกุล
    }
    return parts[0][0].toUpperCase();
  }

  // ✅ ดึงความโค้งมนจาก Tokens
  BorderRadius _getBorderRadius(JpjoyTokens tokens) {
    if (shape == AvatarShape.circle) {
      return BorderRadius.circular(tokens.radiusPill); // 999.0
    }
    return BorderRadius.circular(tokens.radiusSmall); // 8.0
  }

  @override
  Widget build(BuildContext context) {
    // ✅ เรียกใช้ Tokens (ค่าเริ่มต้นเป็น Light Mode)
    final tokens = JpjoyTokens.light();
    final double avatarSize = _getSizeValue();
    
    Widget content;

    if (src != null && src!.isNotEmpty) {
      // 1. กรณีมีรูปภาพ
      content = ClipRRect(
        borderRadius: _getBorderRadius(tokens),
        child: Image.network(
          src!,
          width: avatarSize,
          height: avatarSize,
          fit: BoxFit.cover,
          // ✅ จัดการ Error ถ้าโหลดรูปไม่ได้ ให้โชว์ Initials แทน
          errorBuilder: (context, error, stackTrace) => _buildInitials(tokens, avatarSize),
        ),
      );
    } else if (_getInitials() != null) {
      // 2. กรณีไม่มีรูปแต่มีชื่อ (Show Initials)
      content = _buildInitials(tokens, avatarSize);
    } else {
      // 3. กรณีไม่มีข้อมูลเลย (Placeholder Icon)
      content = Icon(
        Icons.person,
        size: avatarSize * 0.5,
        color: tokens.colorTextSecondary.withOpacity(0.5),
      );
    }

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        // ✅ ใช้สีพื้นหลัง Tertiary จาก Tokens
        color: tokens.colorSurfaceTertiary,
        borderRadius: _getBorderRadius(tokens),
      ),
      child: content,
    );
  }

  // Helper สำหรับสร้าง Text อักษรย่อ
  Widget _buildInitials(JpjoyTokens tokens, double avatarSize) {
    return Center(
      child: Text(
        _getInitials() ?? '?',
        style: TextStyle(
          fontSize: avatarSize * 0.4,
          fontWeight: FontWeight.normal,
          color: tokens.colorTextPrimary,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}