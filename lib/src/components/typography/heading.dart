import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';

enum HeadingLevel { h1, h2, h3, h4, h5, h6 }

class Heading extends StatelessWidget {
  final String text;
  final HeadingLevel level;
  final bool inverse;
  final TextAlign? textAlign;

  const Heading(
    this.text, {
    super.key,
    this.level = HeadingLevel.h2,
    this.inverse = false,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    // ดึงค่า Tokens มาจาก Provider (ถ้าหาไม่เจอจะ Error ทันที เราจะได้รู้)
    final theme = JpjoyThemeProvider.of(context);
    final tokens = theme.tokens;

    // คำนวณขนาดจาก Base FontSize ใน Tokens (13.0)
    double getFontSize() {
      switch (level) {
        case HeadingLevel.h1: return tokens.fontSizeCaptionMedium * 3.0; // 39.0
        case HeadingLevel.h2: return tokens.fontSizeCaptionMedium * 2.5; // 32.5
        case HeadingLevel.h3: return tokens.fontSizeCaptionMedium * 2.0; // 26.0
        case HeadingLevel.h4: return tokens.fontSizeCaptionMedium * 1.5; // 19.5
        case HeadingLevel.h5: return tokens.fontSizeCaptionMedium * 1.25; // 16.25
        case HeadingLevel.h6: return tokens.fontSizeCaptionMedium * 1.1;  // 14.3
      }
    }

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: getFontSize(),
        fontWeight: tokens.fontWeightBold,
        height: tokens.lineHeightHeading,
        letterSpacing: tokens.letterSpacingTight,
        color: inverse ? tokens.colorTextInverse : tokens.colorTextPrimary,
        // เอา fontFamily ออกก่อนเพื่อความชัวร์ว่าเครื่องจะเรนเดอร์ขึ้น
        decoration: TextDecoration.none,
      ),
    );
  }
}