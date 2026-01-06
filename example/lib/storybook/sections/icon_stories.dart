import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';

// ✅ Import โดยใช้ Alias ตามที่คุณใช้ใน Gallery
import 'package:lookmix_design_system/src/icon/linear/linear_icons.dart' as linear;
import 'package:lookmix_design_system/src/icon/bold/bold_icons.dart' as bold;
import 'package:lookmix_design_system/src/icon/icon.dart'; 

class IconStories extends StatelessWidget {
  const IconStories({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: tokens.colorPrimaryDefault,
            unselectedLabelColor: tokens.colorTextTertiary,
            indicatorColor: tokens.colorPrimaryDefault,
            tabs: const [
              Tab(text: "Linear Icons"),
              Tab(text: "Bold Icons"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildIconGrid(context, _getLinearIcons()),
                _buildIconGrid(context, _getBoldIcons()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ แก้ไขชื่อ Class ให้ตรงตามที่คุณใช้ใน Gallery (linear.xxxIcon)
  Map<String, Widget> _getLinearIcons() {
    return {
      "Home": const linear.HomeIcon(),
      "Search": const linear.SearchIcon(),
      "Settings": const linear.SettingIcon(),
      "User": const linear.UserIcon(),
      "Facebook": const linear.FacebookIcon(),
      "Instagram": const linear.InstagramIcon(),
      "Heart": const linear.HeartIcon(),
      "Calendar": const linear.CalendarIcon(),
      "Bell": const linear.BellIcon(),
      "Star": const linear.StarIcon(),
    };
  }

  // ✅ แก้ไขชื่อ Class ให้ตรงตามที่คุณใช้ใน Gallery (bold.xxxBoldIcon)
  Map<String, Widget> _getBoldIcons() {
    return {
      "Home": const bold.HomeBoldIcon(),
      "Search": const bold.SearchBoldIcon(),
      "Left": const bold.LeftBoldIcon(),
      "Right": const bold.RightBoldIcon(),
      "Top": const bold.TopBoldIcon(),
      "Pants": const bold.PantsBoldIcon(),
      "Cart": const bold.CartBoldIcon(),
      "Instagram": const bold.InstagramBoldIcon(),
      "Check Circle": const bold.CheckBoldCircleIcon(),
      "Close Circle": const bold.CloseBoldCircleIcon(),
    };
  }

  Widget _buildIconGrid(BuildContext context, Map<String, Widget> icons) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    final names = icons.keys.toList();
    final widgets = icons.values.toList();

    return GridView.builder(
      padding: EdgeInsets.all(tokens.spaceMedium),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: icons.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: tokens.colorSurfaceSecondary,
                borderRadius: BorderRadius.circular(tokens.radiusMedium),
                border: Border.all(color: tokens.colorSurfaceTertiary.withOpacity(0.5)),
              ),
              child: LookmixIcon(
                icon: widgets[index],
                size: 24,
                color: tokens.colorTextPrimary,
                onTap: () => print("Clicked on: ${names[index]}"),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              names[index],
              style: TextStyle(fontSize: 10, color: tokens.colorTextSecondary),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }
}