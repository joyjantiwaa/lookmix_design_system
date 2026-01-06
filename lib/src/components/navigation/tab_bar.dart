import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/components/navigation/tab_bar_item.dart';

class MyTabBar extends StatelessWidget {
  final List<TabBarItem> items;
  final String? selectedValue;
  final ValueChanged<String>? onTabChange;
  final bool fullWidth;

  const MyTabBar({
    super.key,
    required this.items,
    this.selectedValue,
    this.onTabChange,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    // กำหนดค่า Tokens (Mapping จาก SCSS)
    const textPrimary = Color(0xFF111827);    // --colors-text-primary
    const textTertiary = Color(0xFF9CA3AF);   // --colors-text-tertiary
    const primaryDefault = Color(0xFF3B82F6); // --colors-primary-default

    Widget content = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      children: items.map((item) {
        final isSelected = selectedValue == item.value;

        Widget tab = _TabItem(
          item: item,
          isSelected: isSelected,
          onTap: () => onTabChange?.call(item.value),
          activeColor: primaryDefault,
          selectedTextColor: textPrimary,
          unselectedTextColor: textTertiary,
        );

        // ถ้า fullWidth ให้ขยายแต่ละ Tab เท่าๆ กัน
        return fullWidth ? Expanded(child: tab) : tab;
      }).toList(),
    );

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        // เพิ่มเส้นขอบล่างจางๆ (ถ้าต้องการให้เหมือน Navbar ทั่วไป)
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: fullWidth
          ? content
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              // ซ่อน Scrollbar ตาม SCSS: scrollbar-width: none
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), // --spacing-medium
                child: content,
              ),
            ),
    );
  }
}

class _TabItem extends StatefulWidget {
  final TabBarItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const _TabItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.activeColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
  });

  @override
  State<_TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<_TabItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12), // --spacing-medium
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              // Content: Icon + Label
              Padding(
                padding: const EdgeInsets.only(bottom: 2), // เผื่อที่ให้ Indicator
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.item.icon != null) ...[
                      IconTheme(
                        data: IconThemeData(
                          size: 18,
                          color: widget.isSelected || _isHovered 
                              ? widget.selectedTextColor 
                              : widget.unselectedTextColor,
                        ),
                        child: widget.item.icon!,
                      ),
                      const SizedBox(width: 8), // --spacing-small
                    ],
                    Text(
                      widget.item.label,
                      style: TextStyle(
                        fontSize: 16, // --typography-sizes-body-large
                        fontWeight: widget.isSelected 
                            ? FontWeight.w500  // --typography-font-weight-medium
                            : FontWeight.w400, // --typography-font-weight-regular
                        color: widget.isSelected || _isHovered 
                            ? widget.selectedTextColor 
                            : widget.unselectedTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              // Indicator (เลียนแบบ &::after ใน SCSS)
              Positioned(
                bottom: -16, // ให้ชิดขอบล่างสุดของ container
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: widget.isSelected ? 1.0 : 0.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    height: 2,
                    decoration: BoxDecoration(
                      color: widget.activeColor,
                    ),
                    transform: Matrix4.identity()
                      ..scale(widget.isSelected ? 1.0 : 0.0, 1.0),
                    transformAlignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}