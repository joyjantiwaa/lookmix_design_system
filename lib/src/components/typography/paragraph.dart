import 'package:flutter/widgets.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';

enum ParagraphSize { small, medium, large }

class Paragraph extends StatelessWidget {
  final String text;
  final ParagraphSize size;
  final bool isSecondary;
  final bool inverse;

  const Paragraph(
    this.text, {
    super.key,
    this.size = ParagraphSize.medium,
    this.isSecondary = false,
    this.inverse = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = JpjoyThemeProvider.of(context);
    final tokens = theme.tokens;

    // เลือกสีตามสถานะ (Secondary สำหรับคำอธิบายประกอบ หรือ Inverse เมื่ออยู่บนพื้นหลังเข้ม)
    Color getTextColor() {
      if (inverse) return tokens.colorTextInverse;
      return isSecondary ? tokens.colorTextSecondary : tokens.colorTextPrimary;
    }

    return Text(
      text,
      style: TextStyle(
        // ใช้ base 13px แล้วขยับเป็น 15-16px สำหรับ paragraph
        fontSize: tokens.fontSizeCaptionMedium + 2.0, 
        fontWeight: tokens.fontWeightRegular,
        height: tokens.lineHeightBase, // 1.5 ทำให้อ่านง่าย
        color: getTextColor(),
        decoration: TextDecoration.none,
      ),
    );
  }
}