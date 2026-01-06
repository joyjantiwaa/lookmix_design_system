import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';

class ComponentPreview extends StatelessWidget {
  final String name;
  final Widget child;

  const ComponentPreview({super.key, required this.name, required this.child});

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ชื่อ Component
        Text(name, style: TextStyle(fontWeight: tokens.fontWeightBold, fontSize: 16, color: tokens.colorTextPrimary)),
        const SizedBox(height: 12),
        // พื้นที่แสดงตัวอย่าง
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(tokens.spaceMedium),
          decoration: BoxDecoration(
            color: tokens.colorSurfaceSecondary, // สีพื้นหลังที่ต่างจากตัว Component
            borderRadius: BorderRadius.circular(tokens.radiusMedium),
            border: Border.all(color: tokens.colorBorderDefault),
          ),
          child: Center(child: child),
        ),
        const SizedBox(height: 32), // ระยะห่างระหว่างตัวอย่าง
      ],
    );
  }
}