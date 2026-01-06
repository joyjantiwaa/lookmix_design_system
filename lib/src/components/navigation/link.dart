import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyLink extends StatefulWidget {
  final String href;
  final Widget child;
  final bool external;
  final bool noStyles;
  final bool disabled;
  final VoidCallback? onClick;
  final TextStyle? style;

  const MyLink({
    super.key,
    this.href = '#',
    required this.child,
    this.external = false,
    this.noStyles = false,
    this.disabled = false,
    this.onClick,
    this.style,
  });

  @override
  State<MyLink> createState() => _MyLinkState();
}

class _MyLinkState extends State<MyLink> {
  bool _isHovered = false;

  // ตรวจสอบว่าเป็นลิงก์ภายนอกหรือไม่ (Logic เดียวกับ React)
  bool get _isExternalLink {
    return widget.external ||
        widget.href.startsWith('http') ||
        widget.href.startsWith('mailto') ||
        widget.href.startsWith('tel');
  }

  Future<void> _handleTap() async {
    if (widget.disabled) return;

    // เรียก onClick callback ถ้ามี
    widget.onClick?.call();

    if (_isExternalLink) {
      final Uri url = Uri.parse(widget.href);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } else {
      // สำหรับ Internal Link: ใช้ Navigator หรือ Router ของคุณ
      // ตัวอย่าง: Navigator.pushNamed(context, widget.href);
      debugPrint('Navigating to internal route: ${widget.href}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Tokens / Theme Colors
    const primaryColor = Color(0xFF3B82F6); // --colors-primary-default
    const textPrimary = Color(0xFF111827); // --colors-text-primary
    const textTertiary = Color(0xFF9CA3AF); // --colors-text-tertiary

    if (widget.disabled) {
      return Opacity(
        opacity: 0.5, // --effects-opacity-disabled
        child: DefaultTextStyle(
          style: widget.noStyles 
              ? const TextStyle() 
              : const TextStyle(color: textTertiary, fontSize: 16),
          child: widget.child,
        ),
      );
    }

    // สไตล์พื้นฐานตาม .link ใน SCSS
    final baseStyle = TextStyle(
      color: _isHovered ? primaryColor : textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Prompt', // สมมติว่าเป็น typography-font-family ของคุณ
    );

    return MouseRegion(
      cursor: widget.disabled 
          ? SystemMouseCursors.basic 
          : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: widget.noStyles
            ? widget.child
            : AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 150), // duration-fast
                style: widget.style ?? baseStyle,
                child: widget.child,
              ),
      ),
    );
  }
}