import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // ต้องมีตัวนี้

class LookmixIcon extends StatelessWidget {
  final dynamic icon;
  final double size;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const LookmixIcon({
    super.key,
    this.icon,
    this.size = 24.0,
    this.color,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? IconTheme.of(context).color;
    Widget iconWidget;

    if (icon is IconData) {
      iconWidget = Icon(icon, size: size, color: iconColor);
    } else if (icon is String) {
      // ✅ รองรับ Solar Icons ที่พี่แปลงมา
      iconWidget = Iconify(icon, size: size, color: iconColor);
    } else if (icon is Widget) {
      iconWidget = SizedBox(width: size, height: size, child: icon);
    } else if (icon == null) {
      return const SizedBox.shrink();
    } else {
      iconWidget = Icon(Icons.help_outline, size: size, color: iconColor);
    }

    if (onTap != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: _AnimatedIconWrapper(
            size: size,
            padding: padding,
            child: iconWidget,
          ),
        ),
      );
    }

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: iconWidget,
    );
  }
}

/// Widget สำหรับจัดการ Animation เมื่อมีการกด (เลียนแบบ :active ใน SCSS)
class _AnimatedIconWrapper extends StatefulWidget {
  final Widget child;
  final double size;
  final EdgeInsetsGeometry? padding;

  const _AnimatedIconWrapper({
    required this.child,
    required this.size,
    this.padding,
  });

  @override
  State<_AnimatedIconWrapper> createState() => _AnimatedIconWrapperState();
}

class _AnimatedIconWrapperState extends State<_AnimatedIconWrapper> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() => _isPressed = true),
      onPointerUp: (_) => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0, // transform: scale(0.95)
        duration: const Duration(milliseconds: 100),
        child: AnimatedOpacity(
          opacity: _isPressed ? 0.7 : 1.0, // opacity: var(--effects-opacity-hover)
          duration: const Duration(milliseconds: 100),
          child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}