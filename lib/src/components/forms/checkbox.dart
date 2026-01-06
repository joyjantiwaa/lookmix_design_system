import 'package:flutter/material.dart';
import '../../../tokens/tokens.dart';

enum CheckboxSize { sm, md, lg }

class LookmixCheckbox extends StatefulWidget {
  final String? label;
  final bool value;
  final bool indeterminate;
  final CheckboxSize size;
  final bool disabled;
  final ValueChanged<bool?>? onChanged;

  // ✅ ลบคำว่า const ออกจากบรรทัดนี้ เพราะเราใช้ dynamic tokens ข้างใน
  LookmixCheckbox({
    super.key,
    this.label,
    this.value = false,
    this.indeterminate = false,
    this.size = CheckboxSize.md,
    this.disabled = false,
    this.onChanged,
  });

  @override
  State<LookmixCheckbox> createState() => _LookmixCheckboxState();
}

class _LookmixCheckboxState extends State<LookmixCheckbox> {
  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light();

    double boxSize;
    double fontSize;
    double borderRadius;
    double iconSize;

    switch (widget.size) {
      case CheckboxSize.sm:
        boxSize = 14; fontSize = 13; borderRadius = 3; iconSize = 10;
        break;
      case CheckboxSize.md:
        boxSize = 16; fontSize = 14; borderRadius = 4; iconSize = 12;
        break;
      case CheckboxSize.lg:
        boxSize = 20; fontSize = 16; borderRadius = 5; iconSize = 16;
        break;
    }

    final isSelected = widget.value || widget.indeterminate;
    final activeColor = tokens.colorPrimaryDefault;
    final borderColor = isSelected ? activeColor : tokens.colorSurfaceTertiary;

    return GestureDetector(
      onTap: widget.disabled ? null : () => widget.onChanged?.call(!widget.value),
      child: Opacity(
        opacity: widget.disabled ? 0.5 : 1.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                color: isSelected ? activeColor : Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: borderColor, width: 1.5),
              ),
              child: Center(child: _buildIcon(iconSize)),
            ),
            if (widget.label != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.label!,
                  style: TextStyle(fontSize: fontSize, color: tokens.colorTextPrimary),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(double size) {
    if (widget.indeterminate) {
      return Container(width: size * 0.6, height: 2, color: Colors.white);
    }
    return widget.value 
      ? Icon(Icons.check_rounded, color: Colors.white, size: size) 
      : const SizedBox.shrink();
  }
}