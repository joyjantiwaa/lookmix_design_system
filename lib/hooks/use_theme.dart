import 'package:flutter/material.dart';
import '../theme/jpjoy_theme.dart';
import '../theme/theme_provider.dart';

class ThemeController {
  final BuildContext context;

  ThemeController(this.context);

  JpjoyTheme get theme => JpjoyThemeProvider.of(context);

  bool get isDark => theme == JpjoyTheme.dark(); // หรือใช้ตัวแปร flag ใน provider
  bool get isLight => !isDark;

  void toggleTheme() {
    // สมมติว่าคุณใช้ ThemeProviderState เพื่อ toggle
    final state = context.findAncestorStateOfType<_JpjoyThemeProviderState>();
    state?.toggleTheme();
  }

  void setThemeMode(bool darkMode) {
    final state = context.findAncestorStateOfType<_JpjoyThemeProviderState>();
    if (state != null) {
      state._theme = darkMode ? JpjoyTheme.dark() : JpjoyTheme.light();
    }
  }
}

/// Extension เพื่อเรียกง่าย ๆ
extension UseTheme on BuildContext {
  ThemeController get useTheme => ThemeController(this);
}
