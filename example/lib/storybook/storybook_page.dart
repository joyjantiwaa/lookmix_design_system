import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'sections/data_display_stories.dart';
import 'sections/ecommerce_stories.dart';
import 'sections/forms_stories.dart';
import 'sections/navigation_stories.dart';
import 'sections/typography_stories.dart';
import 'sections/icon_stories.dart';
import 'sections/feedback_stories.dart'; 

class StorybookPage extends StatefulWidget {
   StorybookPage({super.key});

  @override
  State<StorybookPage> createState() => _StorybookPageState();
}

class _StorybookPageState extends State<StorybookPage> {
  int _selectedIndex = 0;

  // ✅ 2. เพิ่มหน้าลงใน List (ลำดับต้องตรงกับ destinations ด้านล่าง)
  final List<Widget> _pages = [
     DataDisplayStories(),
     ECommerceStories(),
     FormsStories(),
     NavigationStories(),
     TypographyStories(),
     IconStories(),
     FeedbackStories(), // <--- เพิ่มไว้ลำดับสุดท้าย (Index 6)
  ];

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    final bool isExtended = MediaQuery.of(context).size.width > 1000;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: isExtended,
            selectedIndex: _selectedIndex,
            backgroundColor: tokens.colorSurfacePrimary,
            selectedIconTheme: IconThemeData(color: tokens.colorPrimaryDefault),
            selectedLabelTextStyle: TextStyle(
              color: tokens.colorPrimaryDefault,
              fontWeight: tokens.fontWeightBold,
            ),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations:  [
              NavigationRailDestination(
                icon: Icon(Icons.grid_view_outlined),
                selectedIcon: Icon(Icons.grid_view),
                label: Text('Data Display'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(Icons.shopping_cart),
                label: Text('E-Commerce'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.input_outlined),
                selectedIcon: Icon(Icons.input),
                label: Text('Forms'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: Text('Navigation'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.text_fields_outlined),
                selectedIcon: Icon(Icons.text_fields),
                label: Text('Typography'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.face_outlined),
                selectedIcon: Icon(Icons.face),
                label: Text('Icons'),
              ),
              // ✅ 3. เพิ่มปุ่มเมนูสำหรับ Feedback
              NavigationRailDestination(
                icon: Icon(Icons.notifications_outlined),
                selectedIcon: Icon(Icons.notifications),
                label: Text('Feedback'), // <--- ปุ่มกดเข้าหน้า Feedback
              ),
            ],
          ),
          
           VerticalDivider(thickness: 1, width: 1),

          Expanded(
            child: Container(
              color: tokens.colorSurfaceBackground,
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
          ),
        ],
      ),
    );
  }
}