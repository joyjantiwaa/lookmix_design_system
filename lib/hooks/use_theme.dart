import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';

class ThemeController {
  final BuildContext context;

  ThemeController(this.context);

  JpjoyTheme get theme => JpjoyThemeProvider.of(context);

  bool get isDark => theme == JpjoyTheme.dark(); 
  bool get isLight => !isDark;

  void toggleTheme() {
    // ✅ เชื่อมต่อกับคลาส Public ที่พี่แก้มาแล้ว
    final state = context.findAncestorStateOfType<JpjoyThemeProviderState>();
    state?.toggleTheme();
  }

  void setThemeMode(bool darkMode) {
    // ✅ เชื่อมต่อกับคลาส Public และเรียกใช้เมธอดข้างใน
    final state = context.findAncestorStateOfType<JpjoyThemeProviderState>();
    if (state != null) {
      // ใช้ setState ผ่านเมธอดที่มีอยู่ หรือแก้ค่าข้างใน
      if (darkMode != state.isDark) {
        state.toggleTheme();
      }
    }
  }
}

extension UseTheme on BuildContext {
  ThemeController get useTheme => ThemeController(this);
}