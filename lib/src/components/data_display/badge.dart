import 'package:flutter/material.dart';
// ✅ นำเข้า Tokens เพื่อใช้สีและค่าคงที่จากระบบกลาง
import '../../../tokens/tokens.dart'; 

enum BadgeVariant { primary, secondary, success, danger, warning }
enum BadgeSize { sm, md }

class LookmixBadge extends StatelessWidget {
  final dynamic content; // String หรือ int
  final BadgeVariant variant;
  final BadgeSize size;
  final bool isDot;
  final int max;
  final Widget? child;

  const LookmixBadge({
    super.key, // ใช้ super.key แบบใหม่
    this.content,
    this.variant = BadgeVariant.primary,
    this.size = BadgeSize.md,
    this.isDot = false,
    this.max = 99,
    this.child,
  });

  // ✅ ดึงสีพื้นหลังจาก Tokens
  Color _getBackgroundColor(JpjoyTokens tokens) {
    switch (variant) {
      case BadgeVariant.primary:
        return tokens.colorPrimaryDefault;
      case BadgeVariant.secondary:
        return tokens.colorSurfaceSecondary;
      case BadgeVariant.success:
        return tokens.colorStatusPositive; // สีเขียวจาก Token
      case BadgeVariant.danger:
        return tokens.colorStatusNegative; // สีแดงจาก Token
      case BadgeVariant.warning:
        return tokens.colorStatusWarning;  // สีส้ม/เหลืองจาก Token
    }
  }

  // ✅ ดึงสีตัวอักษรจาก Tokens
  Color _getTextColor(JpjoyTokens tokens) {
    if (variant == BadgeVariant.secondary) {
      return tokens.colorTextPrimary;
    }
    return tokens.colorTextInverse; // ส่วนใหญ่ใช้สีขาวบนพื้นสีเข้ม
  }

  double _getHeight() {
    switch (size) {
      case BadgeSize.sm: return 16.0;
      case BadgeSize.md: return 20.0;
    }
  }

  double _getFontSize() {
    switch (size) {
      case BadgeSize.sm: return 10.0; // ปรับลดเล็กน้อยเพื่อให้ดูคมชัด
      case BadgeSize.md: return 12.0;
    }
  }

  String? _getDisplayContent() {
    if (isDot) return null;
    if (content is int && content > max) {
      return '$max+';
    }
    return content?.toString();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light();
    final double badgeHeight = _getHeight();
    final double dotSize = 10.0;

    final badgeWidget = Container(
      padding: isDot ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 6),
      height: isDot ? dotSize : badgeHeight,
      constraints: BoxConstraints(
        minWidth: isDot ? dotSize : badgeHeight,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(tokens),
        // ✅ ใช้ค่า radiusPill (999.0) เพื่อให้มนกลมสมบูรณ์แบบ
        borderRadius: BorderRadius.circular(tokens.radiusPill),
        border: child != null
            ? Border.all(color: Colors.white, width: 2) // ตัดขอบขาวเมื่อซ้อนบน Widget อื่น
            : null,
      ),
      alignment: Alignment.center,
      child: !isDot
          ? Text(
              _getDisplayContent() ?? '',
              style: TextStyle(
                color: _getTextColor(tokens),
                fontWeight: FontWeight.w600, // ใช้ semi-bold ให้ดูทันสมัย
                fontSize: _getFontSize(),
                fontFamily: 'Inter',
              ),
            )
          : null,
    );

    // กรณีเป็น Badge ลอย (เช่น แจ้งเตือนบน Icon)
    if (child == null) return badgeWidget;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child!,
        Positioned(
          top: -2, // ขยับขึ้นเล็กน้อยให้ดูสวย
          right: -badgeHeight / 3, // เยื้องขวาออกไปหน่อยตามสไตล์ UI สากล
          child: badgeWidget,
        ),
      ],
    );
  }
}