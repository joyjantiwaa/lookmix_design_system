import 'package:flutter/material.dart';
import 'dart:math' as math;

class ThemeToggler extends StatelessWidget {
  final String? themeMode; // 'light' หรือ 'dark'
  final VoidCallback onToggle;

  const ThemeToggler({
    super.key,
    required this.themeMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == 'dark';

    // การตั้งค่าสีและ Token (ล้อตาม SCSS)
    final Color borderColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;
    final Color bgColor = isDark ? Colors.black : Colors.white;
    final Color iconColor = isDark ? Colors.yellow[700]! : Colors.indigo[900]!;

    return InkWell(
      onTap: onToggle,
      borderRadius: BorderRadius.circular(999), // var(--borders-radius-circle)
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // var(--interactions-transitions-duration-medium)
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Sun Icon Logic
              _AnimatedIcon(
                isActive: !isDark,
                rotateFrom: -math.pi / 2, // -90 degree
                child: Icon(Icons.wb_sunny_outlined, color: iconColor, size: 20),
              ),
              // Moon Icon Logic
              _AnimatedIcon(
                isActive: isDark,
                rotateFrom: math.pi / 2, // 90 degree
                child: Icon(Icons.nightlight_round_outlined, color: iconColor, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget ช่วยทำ Animation สลับ Icon (Rotate + Fade + Scale)
class _AnimatedIcon extends StatelessWidget {
  final bool isActive;
  final double rotateFrom;
  final Widget child;

  const _AnimatedIcon({
    required this.isActive,
    required this.rotateFrom,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: isActive ? EdgeInsets.zero : const EdgeInsets.all(4),
      child: AnimatedRotation(
        turns: isActive ? 0 : rotateFrom / (2 * math.pi),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: AnimatedOpacity(
          opacity: isActive ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedScale(
            scale: isActive ? 1.0 : 0.5,
            duration: const Duration(milliseconds: 300),
            child: child,
          ),
        ),
      ),
    );
  }
}