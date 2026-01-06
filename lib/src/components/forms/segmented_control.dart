import 'package:flutter/material.dart';
import '../../../tokens/tokens.dart';
import 'segmented_control_option.dart';

class JpjoySegmentedControl extends StatelessWidget {
  final List<SegmentedControlOption> options;
  final String value;
  final ValueChanged<String>? onChange;

  const JpjoySegmentedControl({
    super.key,
    this.options = const [],
    this.value = '',
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    // ถ้าไม่มี options ให้ใช้ค่า default เหมือนใน React
    final displayOptions = options.isEmpty
        ? [
            SegmentedControlOption(label: 'Workwear', value: 'workwear'),
            SegmentedControlOption(label: 'Casual', value: 'casual'),
            SegmentedControlOption(label: 'Formal', value: 'formal'),
            SegmentedControlOption(label: 'Gym', value: 'gym'),
          ]
        : options;

    return SizedBox(
      height: 44, 
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: displayOptions.map((option) {
            final isSelected = option.value == value;
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _SegmentedOption(
                label: option.label,
                isSelected: isSelected,
                disabled: option.disabled,
                onTap: () {
                  if (!option.disabled && onChange != null) {
                    onChange!(option.value);
                  }
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _SegmentedOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool disabled;
  final VoidCallback onTap;

  const _SegmentedOption({
    required this.label,
    required this.isSelected,
    required this.disabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light();

    // กำหนดสีตาม Tokens
    final Color activeBg = tokens.colorPrimarySubtle;
    final Color activeText = tokens.colorPrimaryDefault;
    final Color inactiveBg = tokens.colorSurfaceTertiary;
    final Color inactiveText = tokens.colorTextSecondary;

    return Opacity(
      opacity: disabled ? 0.5 : 1.0,
      child: GestureDetector(
        onTap: disabled ? null : onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? activeBg : inactiveBg,
            borderRadius: BorderRadius.circular(99), // Pill shape
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? activeText : inactiveText,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.normal : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}