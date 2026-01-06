import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import '../component_preview.dart';

// ✅ Import ตรงตามชื่อไฟล์และ Class ที่พี่นิยามไว้
import 'package:lookmix_design_system/src/components/data_display/avatar.dart';
import 'package:lookmix_design_system/src/components/data_display/badge.dart';
import 'package:lookmix_design_system/src/components/data_display/banner.dart';
import 'package:lookmix_design_system/src/components/data_display/card.dart';
import 'package:lookmix_design_system/src/components/data_display/divider.dart';
import 'package:lookmix_design_system/src/components/data_display/image.dart';
import 'package:lookmix_design_system/src/components/data_display/logo.dart';

class DataDisplayStories extends StatelessWidget {
  const DataDisplayStories({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return ListView(
      padding: EdgeInsets.all(tokens.spaceMedium),
      children: [
        // --- 1. Avatar ---
        ComponentPreview(
          name: "Avatar",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // ✅ แก้จาก JpjoyAvatar เป็น Avatar และ imageUrl เป็น src ตามต้นฉบับ
              Avatar(size: 40.0, src: "https://i.pravatar.cc/150?u=1"),
              SizedBox(width: 16),
              Avatar(size: AvatarSize.lg, src: "https://i.pravatar.cc/150?u=2"),
            ],
          ),
        ),

        // --- 2. Badge ---
        ComponentPreview(
          name: "Badge",
          child: Wrap(
            spacing: 8,
            children: [
              // ✅ แก้จาก JpjoyBadge เป็น LookmixBadge และใช้ variant แทน color ตรงๆ
              const LookmixBadge(content: "New", variant: BadgeVariant.primary),
              const LookmixBadge(content: "Sale", variant: BadgeVariant.danger),
              LookmixBadge(content: 10, variant: BadgeVariant.success),
            ],
          ),
        ),

        // --- 3. Banner ---
        ComponentPreview(
          name: "Banner",
          child: LookmixBanner(
            // ✅ แก้เป็น Text widget เพราะในต้นฉบับรับเป็น Widget? title
            title: const Text("Summer Sale!"),
            subtitle: const Text("Up to 50% off on all items"),
            ctaText: "Shop Now",
            onCtaClick: () {},
          ),
        ),

        // --- 4. Card ---
        ComponentPreview(
          name: "Card",
          child: CardWidget(
            // ✅ ลบ padding ออกเพราะในต้นฉบับ CardWidget ไม่มี parameter padding (มันคำนวณข้างในเอง)
            title: "Standard Card",
            child: Text(
              "This card uses internal token spacing.",
              style: TextStyle(color: tokens.colorTextPrimary),
            ),
          ),
        ),

        // --- 5. Divider ---
        ComponentPreview(
          name: "Divider",
          child: Column(
            children: const [
              Text("Content Above"),
              // ✅ แก้จาก JpjoyDivider เป็น DividerWidget
              DividerWidget(),
              Text("Content Below"),
            ],
          ),
        ),

        // --- 6. Image ---
        ComponentPreview(
          name: "Image (Custom)",
          child: ImageWidget(
            // ✅ แก้ url เป็น src และต้องมี alt ตามต้นฉบับ
            src: "https://picsum.photos/400/200",
            alt: "Random Image",
            width: 300,
            height: 150,
            borderRadius: BorderRadius.circular(tokens.radiusMedium),
          ),
        ),

        // --- 7. Logo ---
        ComponentPreview(
          name: "Logo",
          // ✅ แก้จาก JpjoyLogo เป็น Logo
          child: const Logo(name: "LOOKMIX", size: 40),
        ),
      ],
    );
  }
}