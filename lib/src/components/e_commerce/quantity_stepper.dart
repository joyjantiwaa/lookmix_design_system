import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChange;
  final bool disabled;

  const QuantityStepper({
    super.key,
    required this.value,
    this.min = 1,
    this.max = 99,
    required this.onChange,
    this.disabled = false,
  });

  void _handleDecrement() {
    if (value > min && !disabled) {
      onChange(value - 1);
    }
  }

  void _handleIncrement() {
    if (value < max && !disabled) {
      onChange(value + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mapping Tokens จาก SCSS
    const borderColor = Color(0xFFE5E7EB); // --borders-default-color
    const textPrimary = Color(0xFF111827); // --colors-text-primary
    const textTertiary = Color(0xFF9CA3AF); // --colors-text-tertiary
    const surfaceBg = Colors.white; // --colors-surface-background

    return Opacity(
      opacity: disabled ? 0.6 : 1.0,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: surfaceBg,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8), // --borders-radius-medium
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ปุ่มลดจำนวน (-)
            _StepperButton(
              icon: Icons.remove_rounded,
              onPressed: (disabled || value <= min) ? null : _handleDecrement,
              color: textPrimary,
              disabledColor: textTertiary,
            ),
            
            // ตัวเลขแสดงจำนวน
            Container(
              width: 40,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: borderColor),
                  right: BorderSide(color: borderColor),
                ),
              ),
              child: Text(
                '$value',
                style: TextStyle(
                  fontWeight: FontWeight.w500, // --typography-font-weight-medium
                  color: disabled ? textTertiary : textPrimary,
                ),
              ),
            ),

            // ปุ่มเพิ่มจำนวน (+)
            _StepperButton(
              icon: Icons.add_rounded,
              onPressed: (disabled || value >= max) ? null : _handleIncrement,
              color: textPrimary,
              disabledColor: textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;
  final Color disabledColor;

  const _StepperButton({
    required this.icon,
    this.onPressed,
    required this.color,
    required this.disabledColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 40,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 20,
          color: onPressed == null ? disabledColor : color,
        ),
      ),
    );
  }
}