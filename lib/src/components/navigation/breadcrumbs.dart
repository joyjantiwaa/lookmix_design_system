import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/components/navigation/breadcrumbs_item.dart';

class Breadcrumbs extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final double? fontSize;

  const Breadcrumbs({
    super.key,
    required this.items,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    // กำหนดสีและสไตล์ตาม SCSS
    const textPrimary = Color(0xFF111827);    // --colors-text-primary
    const textSecondary = Color(0xFF6B7280);  // --colors-text-secondary
    const textTertiary = Color(0xFF9CA3AF);   // --colors-text-tertiary
    const primaryDefault = Color(0xFF3B82F6); // --colors-primary-default

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4, // --spacing-xs (Gap ระหว่างไอเทม)
      runSpacing: 4, // ระยะห่างกรณีขึ้นบรรทัดใหม่
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isLast = index == items.length - 1;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Item Label (Link หรือ Text ธรรมดา)
            if (!isLast && item.href != null)
              _BreadcrumbLink(
                label: item.label,
                onTap: () {
                  // TODO: นำทางไปตาม href (เช่นใช้ GoRouter หรือ Navigator)
                  print('Navigate to: ${item.href}');
                },
                defaultColor: textSecondary,
                hoverColor: primaryDefault,
              )
            else
              Text(
                item.label,
                style: TextStyle(
                  color: textPrimary,
                  fontSize: fontSize ?? 12, // --typography-sizes-caption-default
                  fontWeight: FontWeight.w500, // --typography-font-weight-medium
                ),
              ),

            // Separator Icon
            if (!isLast)
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.chevron_right, // mingcute:right-line
                  size: 14,
                  color: textTertiary,
                ),
              ),
          ],
        );
      }).toList(),
    );
  }
}

// Widget สำหรับจัดการ Link Hover State
class _BreadcrumbLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color defaultColor;
  final Color hoverColor;

  const _BreadcrumbLink({
    required this.label,
    required this.onTap,
    required this.defaultColor,
    required this.hoverColor,
  });

  @override
  State<_BreadcrumbLink> createState() => _BreadcrumbLinkState();
}

class _BreadcrumbLinkState extends State<_BreadcrumbLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: TextStyle(
            color: _isHovered ? widget.hoverColor : widget.defaultColor,
            fontSize: 12,
            decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}