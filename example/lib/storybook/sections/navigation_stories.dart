import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import '../component_preview.dart';

// ✅ Import ผ่านชื่อ Package และใช้ Class Name ที่ถูกต้อง
import 'package:lookmix_design_system/src/components/navigation/header.dart';
import 'package:lookmix_design_system/src/components/navigation/header_nav_item.dart';
import 'package:lookmix_design_system/src/components/navigation/footer.dart';
import 'package:lookmix_design_system/src/components/navigation/breadcrumbs.dart';
import 'package:lookmix_design_system/src/components/navigation/breadcrumbs_item.dart';
import 'package:lookmix_design_system/src/components/navigation/tab_bar.dart';
import 'package:lookmix_design_system/src/components/navigation/tab_bar_item.dart';
import 'package:lookmix_design_system/src/components/navigation/link.dart';

class NavigationStories extends StatefulWidget {
   NavigationStories({super.key});

  @override
  State<NavigationStories> createState() => _NavigationStoriesState();
}

class _NavigationStoriesState extends State<NavigationStories> {
  // สร้าง State สำหรับเลือก Tab
  String _selectedTab = "all";

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return ListView(
      padding: EdgeInsets.all(tokens.spaceMedium),
      children: [
        // --- 1. Header (ใช้ MyHeader ตามไฟล์) ---
        ComponentPreview(
          name: "Header (Website & App Variants)",
          child: Column(
            children: [
              MyHeader(
                variant: HeaderVariant.website,
                logoName: "LOOKMIX",
                navItems:  [
                  HeaderNavItem(label: "Home", href: "/"),
                  HeaderNavItem(label: "Shop", href: "/shop"),
                  HeaderNavItem(label: "About", href: "/about"),
                ],
                action: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon:  Icon(Icons.search), onPressed: () {}),
                    IconButton(icon:  Icon(Icons.shopping_bag_outlined), onPressed: () {}),
                  ],
                ),
              ),
               SizedBox(height: 24),
              MyHeader(
                variant: HeaderVariant.app,
                title: "Product Detail",
                onBack: () => print("Back pressed"),
                rightContent: IconButton(
                  icon:  Icon(Icons.share_outlined, size: 20),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),

        // --- 2. Breadcrumbs (ใช้ BreadcrumbItem) ---
        ComponentPreview(
          name: "Breadcrumbs",
          child: Breadcrumbs(
            items:  [
              BreadcrumbItem(label: "Home", href: "/"),
              BreadcrumbItem(label: "Category", href: "/cat"),
              BreadcrumbItem(label: "Current Product"), // ไม่มี href คืออันสุดท้าย
            ],
          ),
        ),

        // --- 3. Tab Bar (ใช้ MyTabBar และ TabBarItem) ---
        ComponentPreview(
          name: "Tab Bar",
          child: MyTabBar(
            selectedValue: _selectedTab,
            onTabChange: (val) {
              setState(() => _selectedTab = val);
            },
            items:  [
              TabBarItem(label: "All Products", value: "all", icon: Icon(Icons.grid_view)),
              TabBarItem(label: "New", value: "new"),
              TabBarItem(label: "Sale", value: "sale"),
            ],
          ),
        ),

        // --- 4. Links (ใช้ MyLink ตามไฟล์) ---
        ComponentPreview(
          name: "Action Links",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyLink(
                href: "https://google.com",
                external: true,
                child:  Text("External Link"),
              ),
               SizedBox(width: 24),
              MyLink(
                onClick: () => print("Clicked internal link"),
                child:  Text("Internal Action"),
              ),
            ],
          ),
        ),

        // --- 5. Footer (ใช้ MyFooter) ---
        ComponentPreview(
          name: "Footer",
          child:  MyFooter(),
        ),
      ],
    );
  }
}