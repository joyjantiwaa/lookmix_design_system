import 'package:flutter/material.dart';
import 'jpjoy_theme.dart';

class JpjoyThemeProvider extends StatefulWidget {
  final Widget child;
  final bool isDark;

  const JpjoyThemeProvider({Key? key, required this.child, this.isDark = false})
      : super(key: key);

  @override
  _JpjoyThemeProviderState createState() => _JpjoyThemeProviderState();

  // ดึงข้อมูล Theme ไปใช้
  static JpjoyTheme of(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    assert(inherited != null, 'No JpjoyThemeProvider found in context');
    return inherited!.theme;
  }

  // ✅ ต้องย้ายมาไว้ข้างในนี้ เพื่อให้เรียก JpjoyThemeProvider.toggle(context) ได้
  static void toggle(BuildContext context) {
    final state = context.findAncestorStateOfType<_JpjoyThemeProviderState>();
    state?.toggleTheme();
  }
} // <--- จบ Class JpjoyThemeProvider

class _JpjoyThemeProviderState extends State<JpjoyThemeProvider> {
  late bool _isDark;
  late JpjoyTheme _theme;

  @override
  void initState() {
    super.initState();
    _isDark = widget.isDark;
    _theme = _isDark ? JpjoyTheme.dark() : JpjoyTheme.light();
  }

  void toggleTheme() {
    setState(() {
      _isDark = !_isDark;
      _theme = _isDark ? JpjoyTheme.dark() : JpjoyTheme.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedTheme(theme: _theme, child: widget.child);
  }
}

class _InheritedTheme extends InheritedWidget {
  final JpjoyTheme theme;

  const _InheritedTheme({required Widget child, required this.theme})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant _InheritedTheme oldWidget) =>
      theme != oldWidget.theme; // แจ้งเตือนเมื่อ theme เปลี่ยน
}