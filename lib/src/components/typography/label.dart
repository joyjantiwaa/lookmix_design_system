import 'package:flutter/widgets.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';

class Label extends StatelessWidget {
  final String text;
  final bool required;

  const Label(
    this.text, {
    super.key,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ ดึง tokens มาใช้แทน JpJoyTextVariants
    final theme = JpjoyThemeProvider.of(context);
    final tokens = theme.tokens;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start, // ให้ดอกจันอยู่ระดับบนของตัวอักษร
      children: [
        Text(
          text, 
          style: TextStyle(
            // ✅ ใช้ค่าจาก tokens ที่พี่กำหนดไว้
            fontSize: tokens.fontSizeCaptionMedium, // 13.0
            fontWeight: tokens.fontWeightMedium,     // FontWeight.w500
            color: tokens.colorTextPrimary,
            height: tokens.lineHeightBase,          // 1.5
            decoration: TextDecoration.none,         // กันเส้นใต้เหลือง
          ),
        ),
        if (required)
          Text(
            ' *',
            style: TextStyle(
              // ✅ ใช้สี Status Negative จาก tokens
              color: tokens.colorStatusNegative,
              fontWeight: tokens.fontWeightBold,
              fontSize: tokens.fontSizeCaptionMedium,
              decoration: TextDecoration.none,
            ),
          ),
      ],
    );
  }
}