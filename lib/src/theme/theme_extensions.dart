import 'package:flutter/material.dart';

/// 1. คลาสสำหรับขยาย ThemeData ให้รองรับ Design Tokens ของ Lookmix
class LookmixThemeExtension extends ThemeExtension<LookmixThemeExtension> {
  final JpjoyTokens tokens;

  const LookmixThemeExtension({required this.tokens});

  @override
  ThemeExtension<LookmixThemeExtension> copyWith({JpjoyTokens? tokens}) {
    return LookmixThemeExtension(tokens: tokens ?? this.tokens);
  }

  @override
  ThemeExtension<LookmixThemeExtension> lerp(
    covariant ThemeExtension<LookmixThemeExtension>? other,
    double t,
  ) {
    if (other is! LookmixThemeExtension) return this;
    return t < 0.5 ? this : other;
  }
}

/// 2. คลาสเก็บค่า Design Tokens (ต้องอยู่ที่นี่ด้วย Analyze ถึงจะหาเจอ)
class JpjoyTokens {
  // --- COLORS ---
  final Color colorPrimaryDefault;
  final Color colorPrimaryHover;
  final Color colorPrimaryActive;
  final Color colorPrimarySubtle;
  final Color colorSecondaryDefault;
  final Color colorSecondaryHover;
  final Color colorSecondaryActive;
  final Color colorSurfaceBackground;
  final Color colorSurfacePrimary;
  final Color colorSurfaceSecondary;
  final Color colorSurfaceTertiary;
  final Color colorTextPrimary;
  final Color colorTextSecondary;
  final Color colorTextTertiary;
  final Color colorTextInverse;
  final Color colorStatusPositive;
  final Color colorStatusNegative;
  final Color colorStatusWarning;
  final Color colorStatusInfo;
  final Color colorBorderDefault;

  // --- TYPOGRAPHY & SPACING (ตัวอย่างค่าคงที่) ---
  final double spaceDefault = 16.0;
  final double radiusMedium = 16.0;

  // Constructor
  JpjoyTokens({
    required this.colorPrimaryDefault,
    required this.colorPrimaryHover,
    required this.colorPrimaryActive,
    required this.colorPrimarySubtle,
    required this.colorSecondaryDefault,
    required this.colorSecondaryHover,
    required this.colorSecondaryActive,
    required this.colorSurfaceBackground,
    required this.colorSurfacePrimary,
    required this.colorSurfaceSecondary,
    required this.colorSurfaceTertiary,
    required this.colorTextPrimary,
    required this.colorTextSecondary,
    required this.colorTextTertiary,
    required this.colorTextInverse,
    required this.colorStatusPositive,
    required this.colorStatusNegative,
    required this.colorStatusWarning,
    required this.colorStatusInfo,
    required this.colorBorderDefault,
  });

  // Factory สำหรับ Light Theme
  factory JpjoyTokens.light() {
    return JpjoyTokens(
      colorPrimaryDefault: const Color(0xFF3B82F6),
      colorPrimaryHover: const Color(0xFF2563EB),
      colorPrimaryActive: const Color(0xFF1D4ED8),
      colorPrimarySubtle: const Color(0xFFEBF5FF),
      colorSecondaryDefault: const Color(0xFFF3F4F6),
      colorSecondaryHover: const Color(0xFFE5E7EB),
      colorSecondaryActive: const Color(0xFFD1D5DB),
      colorSurfaceBackground: const Color(0xFFFFFFFF),
      colorSurfacePrimary: const Color(0xFFFFFFFF),
      colorSurfaceSecondary: const Color(0xFFFAFAFA),
      colorSurfaceTertiary: const Color(0xFFF3F4F6),
      colorTextPrimary: const Color(0xFF111827),
      colorTextSecondary: const Color(0xFF6B7280),
      colorTextTertiary: const Color(0xFF9CA3AF),
      colorTextInverse: const Color(0xFFFFFFFF),
      colorStatusPositive: const Color(0xFF10B981),
      colorStatusNegative: const Color(0xFFEF4444),
      colorStatusWarning: const Color(0xFFF59E0B),
      colorStatusInfo: const Color(0xFF3B82F6),
      colorBorderDefault: const Color(0xFFE5E7EB),
    );
  }

  // Factory สำหรับ Dark Theme
  factory JpjoyTokens.dark() {
    return JpjoyTokens(
      colorPrimaryDefault: const Color(0xFF60A5FA),
      colorPrimaryHover: const Color(0xFF93C5FD),
      colorPrimaryActive: const Color(0xFF3B82F6),
      colorPrimarySubtle: const Color(0x1A3B82F6),
      colorSecondaryDefault: const Color(0xFF374151),
      colorSecondaryHover: const Color(0xFF4B5563),
      colorSecondaryActive: const Color(0xFF1F2937),
      colorSurfaceBackground: const Color(0xFF0F172A),
      colorSurfacePrimary: const Color(0xFF1E293B),
      colorSurfaceSecondary: const Color(0xFF334155),
      colorSurfaceTertiary: const Color(0xFF1E293B),
      colorTextPrimary: const Color(0xFFF9FAFB),
      colorTextSecondary: const Color(0xFFD1D5DB),
      colorTextTertiary: const Color(0xFF9CA3AF),
      colorTextInverse: const Color(0xFF111827),
      colorStatusPositive: const Color(0xFF34D399),
      colorStatusNegative: const Color(0xFFF87171),
      colorStatusWarning: const Color(0xFFF59E0B),
      colorStatusInfo: const Color(0xFF60A5FA),
      colorBorderDefault: const Color(0xFF334155),
    );
  }
}