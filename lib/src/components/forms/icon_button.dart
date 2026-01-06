import 'package:flutter/material.dart';
import '../../../tokens/tokens.dart';

enum IconButtonVariant { filled, ghost, outline, surface, glass }
enum IconButtonShape { circle, squircle, rounded }
enum IconButtonSize { xs, sm, md, lg, xl }

class JpjoyIconButton extends StatefulWidget {
  final dynamic icon;
  final IconButtonVariant variant;
  final IconButtonShape shape;
  final IconButtonSize size;
  final bool disabled;
  final VoidCallback? onPressed;
  final Color? color;

  const JpjoyIconButton({
    super.key,
    required this.icon,
    this.variant = IconButtonVariant.ghost,
    this.shape = IconButtonShape.circle,
    this.size = IconButtonSize.md,
    this.disabled = false,
    this.onPressed,
    this.color,
  });

  @override
  State<JpjoyIconButton> createState() => _JpjoyIconButtonState();
}

class _JpjoyIconButtonState extends State<JpjoyIconButton> {
  bool _isHovered = false;
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light();
    
    // 1. ขนาด (Dimension)
    double dimension;
    double iconSize;
    switch (widget.size) {
      case IconButtonSize.xs: dimension = 24; iconSize = 14; break;
      case IconButtonSize.sm: dimension = 32; iconSize = 16; break;
      case IconButtonSize.md: dimension = 40; iconSize = 20; break;
      case IconButtonSize.lg: dimension = 48; iconSize = 24; break;
      case IconButtonSize.xl: dimension = 56; iconSize = 28; break;
      default: dimension = 40; iconSize = 20;
    }

    // 2. รูปทรง (Shape)
    BorderRadius targetBorderRadius;
    switch (widget.shape) {
      case IconButtonShape.circle: targetBorderRadius = BorderRadius.circular(100); break;
      case IconButtonShape.squircle: targetBorderRadius = BorderRadius.circular(tokens.radiusMedium); break;
      case IconButtonShape.rounded: targetBorderRadius = BorderRadius.circular(tokens.radiusSmall); break;
    }

    // 3. Logic สีและเงา (ใช้ค่าจาก Tokens)
    Color bgColor;
    Color iconColor = widget.color ?? tokens.colorTextPrimary;
    Border? border;
    List<BoxShadow>? shadows;

    switch (widget.variant) {
      case IconButtonVariant.filled:
        iconColor = Colors.white;
        if (_isActive) {
          bgColor = tokens.colorPrimaryActive;
          shadows = tokens.shadowSmall; // ยุบเงาลงตอนกด
        } else if (_isHovered) {
          bgColor = tokens.colorPrimaryHover;
          shadows = tokens.shadowMedium; // เงาชัดขึ้นตอน Hover
        } else {
          bgColor = tokens.colorPrimaryDefault;
          shadows = null;
        }
        break;

      case IconButtonVariant.surface:
        if (_isActive) {
          bgColor = tokens.colorSurfaceTertiary;
          shadows = tokens.shadowSmall;
        } else if (_isHovered) {
          bgColor = tokens.colorSurfaceSecondary;
          shadows = tokens.shadowMedium;
        } else {
          bgColor = tokens.colorSurfacePrimary;
          shadows = tokens.shadowXs; // เงาบางๆ พื้นฐาน
        }
        break;

      case IconButtonVariant.ghost:
        final Color hoverBase = tokens.colorSurfaceSecondary;
        if (_isActive) {
          bgColor = tokens.colorSurfaceTertiary;
        } else if (_isHovered) {
          bgColor = hoverBase;
        } else {
          bgColor = hoverBase.withOpacity(0);
        }
        break;

      case IconButtonVariant.outline:
        final Color hoverBase = tokens.colorSurfaceSecondary;
        border = Border.all(
          color: _isHovered ? tokens.colorTextSecondary : tokens.colorSurfaceTertiary,
          width: 1,
        );
        bgColor = _isActive ? tokens.colorSurfaceTertiary : (_isHovered ? hoverBase : hoverBase.withOpacity(0));
        break;

      case IconButtonVariant.glass:
        border = Border.all(color: Colors.white.withOpacity(0.2));
        bgColor = (_isActive || _isHovered) ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.1);
        shadows = (_isActive || _isHovered) ? tokens.shadowGlass : null;
        break;
      default:
        bgColor = Colors.transparent;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isActive = true),
        onTapUp: (_) => setState(() => _isActive = false),
        onTapCancel: () => setState(() => _isActive = false),
        onTap: widget.disabled ? null : widget.onPressed,
        child: AnimatedScale(
          scale: (_isActive && !widget.disabled) ? 0.95 : 1.0,
          duration: tokens.durationFast, // ใช้ Duration จาก Tokens
          curve: tokens.easingDefault,    // ใช้ Easing จาก Tokens
          child: Opacity(
            opacity: widget.disabled ? tokens.opacityDisabled : 1.0,
            child: AnimatedContainer(
              duration: tokens.durationFast,
              curve: tokens.easingDefault,
              width: dimension,
              height: dimension,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: targetBorderRadius,
                border: border,
                boxShadow: shadows,
              ),
              child: Center(
                child: widget.icon is IconData 
                  ? Icon(widget.icon, size: iconSize, color: iconColor)
                  : widget.icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}