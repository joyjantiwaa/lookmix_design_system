import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import '../../../tokens/tokens.dart';

enum ToastType { success, error, info, warning }

class LookmixToast extends StatelessWidget {
  final String message;
  final ToastType type;
  final VoidCallback onClose;

  const LookmixToast({
    super.key,
    required this.message,
    required this.type,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;

    // เลือกสี Border ซ้ายตาม Type (เลียนแบบ SCSS)
    Color statusColor;
    IconData icon;
    switch (type) {
      case ToastType.success:
        statusColor = tokens.colorStatusPositive;
        icon = Icons.check_circle_outline;
        break;
      case ToastType.error:
        statusColor = tokens.colorStatusNegative;
        icon = Icons.error_outline;
        break;
      case ToastType.warning:
        statusColor = tokens.colorStatusWarning;
        icon = Icons.warning_amber_rounded;
        break;
      case ToastType.info:
      default:
        statusColor = tokens.colorStatusInfo;
        icon = Icons.info_outline;
        break;
    }

    return Material(
      color: Colors.transparent,
      child: Container(
        width: 340, // ปรับให้กว้างขึ้นตามความเหมาะสมของจอ
        constraints: const BoxConstraints(minHeight: 56),
        padding: EdgeInsets.symmetric(
          horizontal: tokens.spaceDefault, 
          vertical: tokens.spaceSmall
        ),
        decoration: BoxDecoration(
          color: tokens.colorSurfacePrimary,
          borderRadius: BorderRadius.circular(tokens.radiusMedium),
          boxShadow: tokens.shadowLarge, // ใช้เงาใหญ่ให้ลอยเด่นตาม SCSS
          border: Border(
            left: BorderSide(width: 4, color: statusColor), // เส้นขอบซ้ายพื้นฐาน
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: statusColor, size: 20),
            SizedBox(width: tokens.spaceSmall),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: tokens.colorTextPrimary,
                  height: 1.5,
                ),
              ),
            ),
            // ปุ่มปิด (Close Button)
            IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.close, size: 20),
              color: tokens.colorTextTertiary,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              splashRadius: 20,
              hoverColor: tokens.colorTextPrimary.withOpacity(0.05),
            ),
          ],
        ),
      ),
    );
  }
}

// ตัวจัดการการแสดงผลบนหน้าจอ (Overlay Management)
class ToastService {
  static final List<OverlayEntry> _activeToasts = [];

  static void show(BuildContext context, String message, {ToastType type = ToastType.info}) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => _ToastAnimateWrapper(
        index: _activeToasts.indexOf(entry),
        onComplete: () {
          entry.remove();
          _activeToasts.remove(entry);
        },
        child: LookmixToast(
          message: message,
          type: type,
          onClose: () {
            entry.remove();
            _activeToasts.remove(entry);
          },
        ),
      ),
    );

    _activeToasts.add(entry);
    overlay.insert(entry);

    // Auto dismiss หลังจาก 3 วินาที
    Future.delayed(const Duration(seconds: 3), () {
      if (_activeToasts.contains(entry)) {
        entry.remove();
        _activeToasts.remove(entry);
      }
    });
  }
}

// ส่วนจัดการ Animation (Slide In จากขวา)
class _ToastAnimateWrapper extends StatefulWidget {
  final Widget child;
  final int index;
  final VoidCallback onComplete;

  const _ToastAnimateWrapper({
    required this.child, 
    required this.index,
    required this.onComplete,
  });

  @override
  State<_ToastAnimateWrapper> createState() => _ToastAnimateWrapperState();
}

class _ToastAnimateWrapperState extends State<_ToastAnimateWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // เริ่มจากนอกจอขวา (100%)
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 24.0 + (widget.index * 72.0), // ขยับลงมาตามจำนวน Toast ที่ค้างอยู่
      right: 24,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}