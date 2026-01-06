import 'package:flutter/material.dart';
// ✅ Import ThemeProvider จากโปรเจกต์หลักผ่านชื่อ Package
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
// ✅ Import StorybookPage ที่อยู่ในโฟลเดอร์เดียวกัน (example/lib/storybook/)
import 'storybook/storybook_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return JpjoyThemeProvider(
      // ✅ ส่งพารามิเตอร์ตามที่คลาส JpjoyThemeProvider กำหนดไว้ (เช็คจาก Error ก่อนหน้าที่พี่ส่งมา)
      isDark: false, 
      child: MaterialApp(
        title: 'Lookmix Design System Storybook',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          // พี่สามารถตั้งค่าฟอนต์หลักที่นี่เพื่อให้ Storybook ดูสวยงามขึ้น
        ),
        // ✅ รันหน้า StorybookPage (เอา const ออกเพื่อป้องกัน Error กรณีมีการใช้ตัวแปร Runtime)
        home: StorybookPage(), 
      ),
    );
  }
}