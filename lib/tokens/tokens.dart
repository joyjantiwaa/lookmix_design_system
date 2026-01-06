import 'package:flutter/material.dart';

class JpjoyTokens {
  // ==========================================
  // COLORS
  // ==========================================
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

  // ==========================================
  // TYPOGRAPHY (NEW)
  // ==========================================
  final double fontSizeCaptionMedium = 13.0;
  
  final double lineHeightBase = 1.5;
  final double lineHeightHeading = 1.25;
  final double lineHeightTight = 1.1;

  final FontWeight fontWeightRegular = FontWeight.w400;
  final FontWeight fontWeightMedium = FontWeight.w500;
  final FontWeight fontWeightSemiBold = FontWeight.w600;
  final FontWeight fontWeightBold = FontWeight.w700;

  final double letterSpacingTight = -0.02; // Flutter uses absolute pixel values for em
  final double letterSpacingNormal = 0.0;
  final double letterSpacingWide = 0.02;

  // ==========================================
  // BORDERS & RADIUS
  // ==========================================
  final double radiusSmall = 8.0;
  final double radiusMedium = 16.0;
  final double radiusLarge = 24.0;
  final double radiusPill = 999.0;

// ==========================================
  // SPACING (แก้จาก static const เป็น double ธรรมดา)
  // ==========================================
  final double spaceNone = 0.0;
  final double spaceXs = 4.0;
  final double spaceSmall = 8.0;
  final double spaceDefault = 16.0;
  final double spaceMedium = 24.0;
  final double spaceLarge = 32.0;
  final double spaceXl = 48.0;
  final double spaceXxl = 64.0;

  // ==========================================
  // LAYOUT (NEW)
  // ==========================================
  final double maxPageWidth = 1200.0;
  final double layoutGutter = 20.0;

  // ==========================================
  // EFFECTS & SHADOWS (NEW)
  // ==========================================
  final List<BoxShadow> shadowXs = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 2, offset: Offset(0, 1))
  ];
  final List<BoxShadow> shadowSmall = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 3, offset: Offset(0, 1)),
    BoxShadow(color: Color(0x0F000000), blurRadius: 2, offset: Offset(0, 1)),
  ];
  final List<BoxShadow> shadowMedium = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 6, spreadRadius: -1, offset: Offset(0, 4)),
    BoxShadow(color: Color(0x0F000000), blurRadius: 4, spreadRadius: -1, offset: Offset(0, 2)),
  ];
  final List<BoxShadow> shadowLarge = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 15, spreadRadius: -3, offset: Offset(0, 10)),
    BoxShadow(color: Color(0x0D000000), blurRadius: 6, spreadRadius: -2, offset: Offset(0, 4)),
  ];
  final List<BoxShadow> shadowXl = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 25, spreadRadius: -5, offset: Offset(0, 20)),
    BoxShadow(color: Color(0x0A000000), blurRadius: 10, spreadRadius: -5, offset: Offset(0, 10)),
  ];
  final List<BoxShadow> shadowGlass = [
    BoxShadow(color: Color(0x121F2687), blurRadius: 32, offset: Offset(0, 8))
  ];

  final double opacityDisabled = 0.5;
  final double opacityHover = 0.9;
  final double opacityFaint = 0.3;

  final Gradient gradientPrimary = const LinearGradient(
    begin: Alignment(-0.7, -0.7), // roughly 135deg
    end: Alignment(0.7, 0.7),
    colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
  );
  
  final Gradient gradientGlass = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white.withValues(alpha:0.4), Colors.white.withValues(alpha:0.1)],
  );

  final double blurDefault = 8.0;
  final double blurHeavy = 16.0;
  final double blurBackdrop = 12.0;

  // ==========================================
  // INTERACTIONS (NEW)
  // ==========================================
  final Duration durationFast = const Duration(milliseconds: 150);
  final Duration durationMedium = const Duration(milliseconds: 300);
  final Duration durationSlow = const Duration(milliseconds: 500);

  final Curve easingDefault = const Cubic(0.4, 0, 0.2, 1);
  final Curve easingIn = const Cubic(0.4, 0, 1, 1);
  final Curve easingOut = const Cubic(0, 0, 0.2, 1);

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