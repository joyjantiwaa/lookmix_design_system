import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/tokens/tokens.dart';

enum ButtonAppearance { primary, secondary, tertiary, danger, outline }
enum ButtonSize { sm, md, lg }

class LookmixButton extends StatelessWidget {
  final Widget? children;
  final String? label;
  final ButtonAppearance appearance;
  final ButtonSize size;
  final bool disabled;
  final bool loading;
  final bool fullWidth;
  final String? href;
  final VoidCallback? onClick;

  const LookmixButton({
    super.key,
    this.children,
    this.label,
    this.appearance = ButtonAppearance.primary,
    this.size = ButtonSize.md,
    this.disabled = false,
    this.loading = false,
    this.fullWidth = false,
    this.href,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = JpjoyThemeProvider.of(context);
    final tokens = themeProvider.tokens;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: _buildButton(context, tokens),
    );
  }

  Widget _buildButton(BuildContext context, JpjoyTokens tokens) {
    Color baseBgColor;
    Color hoverBgColor;
    Color activeBgColor;
    Color textColor;
    BorderSide border = BorderSide.none;

    switch (appearance) {
      case ButtonAppearance.primary:
        baseBgColor = tokens.colorPrimaryDefault;
        hoverBgColor = tokens.colorPrimaryHover;
        activeBgColor = tokens.colorPrimaryActive;
        textColor = tokens.colorTextInverse;
        break;
      case ButtonAppearance.outline:
        // ✅ แก้ให้เป็นสีตาม SCSS: พื้นหลังใส ขอบเทา ตัวหนังสือดำ
        baseBgColor = Colors.transparent;
        hoverBgColor = tokens.colorSecondaryHover; 
        activeBgColor = tokens.colorSecondaryActive;
        textColor = tokens.colorTextPrimary;
        // ✅ ใช้สีขอบจาก tokens.colorBorderDefault
        border = BorderSide(color: tokens.colorTextPrimary, width: 1.0); 
        break;
      case ButtonAppearance.tertiary:
        baseBgColor = Colors.transparent;
        hoverBgColor = tokens.colorSecondaryHover;
        activeBgColor = tokens.colorSecondaryActive;
        textColor = tokens.colorTextSecondary; // Tertiary มักจะสีจางกว่า
        border = BorderSide.none; // ไม่มีเส้นขอบ
        break;
      case ButtonAppearance.secondary:
        baseBgColor = tokens.colorSecondaryDefault;
        hoverBgColor = tokens.colorSecondaryHover;
        activeBgColor = tokens.colorSecondaryActive;
        textColor = tokens.colorTextPrimary;
        break;
      case ButtonAppearance.danger:
        baseBgColor = tokens.colorStatusNegative;
        hoverBgColor = tokens.colorStatusNegative.withOpacity(0.8);
        activeBgColor = tokens.colorStatusNegative;
        textColor = tokens.colorTextInverse;
        break;
      default:
        baseBgColor = tokens.colorPrimaryDefault;
        hoverBgColor = tokens.colorPrimaryHover;
        activeBgColor = tokens.colorPrimaryActive;
        textColor = tokens.colorTextInverse;
    }

    // --- ส่วนของ Size และ ButtonStyle (คงเดิมตามของพี่แต่แก้ BorderRadius) ---
    double paddingVertical = tokens.spaceSmall;
    double paddingHorizontal = tokens.spaceMedium;
    double fontSize = 16.0;

    if (size == ButtonSize.sm) {
      paddingVertical = tokens.spaceXs;
      paddingHorizontal = tokens.spaceDefault; 
      fontSize = 14.0;
    } else if (size == ButtonSize.lg) {
      paddingVertical = tokens.spaceDefault;
      paddingHorizontal = tokens.spaceLarge;
      fontSize = 18.0;
    }

    return ElevatedButton(
      onPressed: (disabled || loading) ? null : onClick,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0), // ปิดเงาเพื่อให้เหมือน Web
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return baseBgColor.withOpacity(0.4);
          if (states.contains(WidgetState.pressed)) return activeBgColor;
          if (states.contains(WidgetState.hovered)) return hoverBgColor;
          return baseBgColor;
        }),
        foregroundColor: WidgetStateProperty.all(textColor),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
        ),
        side: WidgetStateProperty.all(border),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            // ✅ เปลี่ยนจาก Pill เป็น radiusSmall (หรือตามที่พี่ต้องการใน Footer)
            borderRadius: BorderRadius.circular(tokens.radiusLarge), 
          ),
        ),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      child: _buildButtonContent(tokens, fontSize, textColor),
    );
  }

  Widget _buildButtonContent(JpjoyTokens tokens, double fontSize, Color textColor) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (loading)
          SizedBox(
            width: fontSize + 2,
            height: fontSize + 2,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
        Opacity(
          opacity: loading ? 0 : 1,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: tokens.fontWeightMedium,
              color: textColor,
            ),
            child: children ?? const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}