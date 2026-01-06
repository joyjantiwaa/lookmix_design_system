import 'package:flutter/material.dart';
// ✅ แก้ Import ชี้ไปที่โฟลเดอร์ tokens ข้างนอก
import '../../tokens/tokens.dart'; 

class JpjoyTheme {
  final JpjoyTokens tokens;
  final bool isDark;

  JpjoyTheme({
    required this.tokens,
    required this.isDark,
  });

  factory JpjoyTheme.light() {
    return JpjoyTheme(
      tokens: JpjoyTokens.light(),
      isDark: false,
    );
  }

  factory JpjoyTheme.dark() {
    return JpjoyTheme(
      tokens: JpjoyTokens.dark(),
      isDark: true,
    );
  }
}