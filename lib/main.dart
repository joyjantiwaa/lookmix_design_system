import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/tokens/tokens.dart';
// ✅ Import หน้า Storybook
import 'package:lookmix_design_system/storybook/storybook_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return JpjoyThemeProvider(
      tokens: JpjoyTokens.light(), // หรือดึงจากระบบสลับ Theme
      child: MaterialApp(
        title: 'Lookmix Design System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        // ✅ เปลี่ยนจากหน้าจอแอปปกติ เป็น Storybook
        home: const StorybookPage(), 
      ),
    );
  }
}