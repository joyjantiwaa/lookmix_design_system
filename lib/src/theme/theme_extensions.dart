import 'package:flutter/material.dart';
import 'jpjoy_theme.dart';

extension ThemeTokens on BuildContext {
  JpjoyTheme get jpjoyTheme => JpjoyThemeProvider.of(this);

  Color color(String path) {
    final value = jpjoyTheme.get(path);
    if (value is String) {
      return _hexToColor(value);
    }
    return Colors.transparent;
  }

  double spacing(String key) {
    final value = jpjoyTheme.get('spacing.$key');
    if (value is int) return value.toDouble();
    if (value is double) return value;
    return 0.0;
  }

  double radius(String key) {
    final value = jpjoyTheme.get('borders.radius.$key');
    if (value is String && value.endsWith('px')) {
      return double.tryParse(value.replaceAll('px', '')) ?? 0.0;
    }
    return 0.0;
  }

  static Color _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}
