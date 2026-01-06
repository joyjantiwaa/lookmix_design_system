import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/components/e_commerce/property_option.dart';

enum PropertySelectorType { text, color }

class PropertySelector extends StatelessWidget {
  final String label;
  final List<PropertyOption> options;
  final String? selectedValue;
  final Function(String) onChange;
  final PropertySelectorType type;

  const PropertySelector({
    super.key,
    required this.label,
    required this.options,
    this.selectedValue,
    required this.onChange,
    this.type = PropertySelectorType.text,
  });

  @override
  Widget build(BuildContext context) {
    // Mapping Tokens จาก SCSS
    const textSecondary = Color(0xFF6B7280);
    const primaryDefault = Color(0xFF3B82F6);
    const primaryLightest = Color(0xFFEFF6FF);
    const borderColor = Color(0xFFE5E7EB);
    const disabledColor = Color(0xFF9CA3AF);
    const disabledBg = Color(0xFFF3F4F6);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 12, // body-small
            fontWeight: FontWeight.w500,
            color: textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8), // spacing-small

        // Options Grid (ใช้ Wrap แทน Flex-wrap)
        Wrap(
          spacing: 8, // gap: var(--spacing-small)
          runSpacing: 8,
          children: options.map((option) {
            final bool isActive = selectedValue == option.value;
            final bool isColorType = type == PropertySelectorType.color;

            return _buildOption(
              option: option,
              isActive: isActive,
              isColorType: isColorType,
              primaryColor: primaryDefault,
              primaryLightest: primaryLightest,
              borderDefault: borderColor,
              disabledColor: disabledColor,
              disabledBg: disabledBg,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildOption({
    required PropertyOption option,
    required bool isActive,
    required bool isColorType,
    required Color primaryColor,
    required Color primaryLightest,
    required Color borderDefault,
    required Color disabledColor,
    required Color disabledBg,
  }) {
    // กำหนดรูปทรงตามประเภท (Text = สี่เหลี่ยมมน, Color = วงกลม)
    final shape = isColorType ? BoxShape.circle : BoxShape.rectangle;
    final borderRadius = isColorType ? null : BorderRadius.circular(8);

    return Opacity(
      opacity: option.disabled ? 0.6 : 1.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: isColorType ? 44 : null,
        height: 44,
        constraints: BoxConstraints(
          minWidth: isColorType ? 44 : 52, // กำหนดค่าขั้นต่ำสำหรับปุ่มตัวอักษรเดียวเช่น S, M
          maxWidth: isColorType ? 44 : 52, // ป้องกันชื่อ Option ยาวเกินไปจนล้นจอ
        ),
        transform: (isColorType && isActive) ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
        decoration: BoxDecoration(
          shape: shape,
          borderRadius: borderRadius,
          color: option.disabled
              ? disabledBg
              : (isActive ? primaryLightest : Colors.white),
          border: Border.all(
            color: isActive ? primaryColor : (option.disabled ? borderDefault : borderDefault),
            width: isActive ? (isColorType ? 2 : 1) : 1,
          ),
          boxShadow: isActive && !isColorType
              ? [BoxShadow(color: primaryColor.withOpacity(0.5), spreadRadius: 0, blurRadius: 0)] // จำลอง 0 0 0 1px
              : null,
        ),
        child: InkWell(
          onTap: option.disabled ? null : () => onChange(option.value),
          customBorder: isColorType ? const CircleBorder() : RoundedRectangleBorder(borderRadius: borderRadius!),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isColorType ? 0 : 16),
            child: Center(
              child: isColorType
                  ? _buildColorCircle(option.color ?? Colors.transparent)
                  : _buildTextLabel(option, isActive, primaryColor, disabledColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
    );
  }

  Widget _buildTextLabel(PropertyOption option, bool isActive, Color primaryColor, Color disabledColor) {
    return Text(
      option.label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        color: option.disabled ? disabledColor : (isActive ? primaryColor : Colors.black87),
        decoration: option.disabled ? TextDecoration.lineThrough : null,
      ),
    );
  }
}