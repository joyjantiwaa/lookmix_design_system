import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme.dart';

class JpjoyThemeProvider extends StatefulWidget {
  final Widget child;
  final bool isDark;
  final dynamic tokens;

  const JpjoyThemeProvider({
    super.key,
    required this.child,
    this.isDark = false,
    this.tokens,
  });

  @override
  JpjoyThemeProviderState createState() => JpjoyThemeProviderState();

  /// ดึงข้อมูล Theme ไปใช้ผ่าน Context
  static JpjoyTheme of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<InheritedThemeData>();
    assert(inherited != null, 'No JpjoyThemeProvider found in context');
    return inherited!.theme;
  }

  /// ฟังก์ชันสำหรับสั่งเปลี่ยน Theme จากภายนอก
  static void toggle(BuildContext context) {
    final state = context.findAncestorStateOfType<JpjoyThemeProviderState>();
    state?.toggleTheme();
  }
}

class JpjoyThemeProviderState extends State<JpjoyThemeProvider> {
  late bool _isDark;
  late JpjoyTheme _theme;

  /// Getter สำหรับเช็คสถานะจากภายนอก
  bool get isDark => _isDark;

  @override
  void initState() {
    super.initState();
    _isDark = widget.isDark;
    _theme = _isDark ? JpjoyTheme.dark() : JpjoyTheme.light();
  }

  /// ฟังก์ชันสลับ Theme
  void toggleTheme() {
    setState(() {
      _isDark = !_isDark;
      _theme = _isDark ? JpjoyTheme.dark() : JpjoyTheme.light();
    });
  }

  /// ฟังก์ชันกำหนด Theme โดยตรง
  void updateTheme(bool darkMode) {
    if (_isDark != darkMode) {
      toggleTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedThemeData(
      theme: _theme,
      child: widget.child,
    );
  }
}

/// InheritedWidget สำหรับส่งต่อข้อมูล Theme ลงไปใน Widget Tree
class InheritedThemeData extends InheritedWidget {
  final JpjoyTheme theme;

  const InheritedThemeData({super.key, 
    required super.child,
    required this.theme,
  });

  @override
  bool updateShouldNotify(covariant InheritedThemeData oldWidget) =>
      theme != oldWidget.theme;
}