import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import '../component_preview.dart';

// ✅ Import ผ่านชื่อ Package ทั้งหมด
import 'package:lookmix_design_system/src/components/forms/button.dart';
import 'package:lookmix_design_system/src/components/forms/icon_button.dart';
import 'package:lookmix_design_system/src/components/forms/text_input.dart';
import 'package:lookmix_design_system/src/components/forms/date_input.dart';
import 'package:lookmix_design_system/src/components/forms/select.dart';
import 'package:lookmix_design_system/src/components/forms/segmented_control.dart';
import 'package:lookmix_design_system/src/components/forms/segmented_control_option.dart';
import 'package:lookmix_design_system/src/components/forms/theme_toggler.dart';

class FormsStories extends StatefulWidget {
   FormsStories({super.key});

  @override
  State<FormsStories> createState() => _FormsStoriesState();
}

class _FormsStoriesState extends State<FormsStories> {
  // สร้าง State สำหรับทดสอบค่า Input ต่างๆ
  String _themeMode = 'light';
  String _selectedSegment = 'Delivery';
  String _selectedCountry = 'TH';

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return ListView(
      padding: EdgeInsets.all(tokens.spaceMedium),
      children: [
        // --- 0. Theme Toggler ---
        ComponentPreview(
          name: "Theme Toggler",
          child: Center(
            child: ThemeToggler(
              themeMode: _themeMode,
              onToggle: () {
                setState(() {
                  _themeMode = _themeMode == 'light' ? 'dark' : 'light';
                });
              },
            ),
          ),
        ),

        // --- 1. Buttons ---
        ComponentPreview(
          name: "Buttons (Variants)",
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              // ✅ แก้เป็น onClick และใช้ children: Text() ตามไฟล์ button.dart
              LookmixButton(
                appearance: ButtonAppearance.primary,
                onClick: () {},
                children:  Text("Primary Button"),
              ),
              LookmixButton(
                loading: true,
                onClick: () {},
                children:  Text("Loading..."),
              ),
              LookmixButton(
                disabled: true,
                onClick: () {},
                children:  Text("Disabled"),
              ),
            ],
          ),
        ),

        ComponentPreview(
          name: "Icon Buttons",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ แก้เป็น onPressed ตามไฟล์ icon_button.dart
              JpjoyIconButton(
                icon: Icons.add,
                variant: IconButtonVariant.filled,
                onPressed: () {},
              ),
               SizedBox(width: 16),
              JpjoyIconButton(
                icon: Icons.delete_outline,
                variant: IconButtonVariant.outline,
                color: tokens.colorStatusNegative,
                onPressed: () {},
              ),
            ],
          ),
        ),

        // --- 2. Text Inputs (ใช้ JpjoyInput ตามไฟล์ใหม่) ---
        ComponentPreview(
          name: "Text Input",
          child: Column(
            children: [
              JpjoyInput(
                label: "Email Address",
                placeholder: "example@mail.com",
                leadingIcon:  Icon(Icons.email_outlined),
              ),
               SizedBox(height: 16),
              JpjoyInput(
                label: "Password",
                placeholder: "Enter password",
                isPassword: true,
                error: "Password is too short", // ✅ แก้จาก errorText เป็น error
              ),
            ],
          ),
        ),

        // --- 3. Date & Select ---
        ComponentPreview(
          name: "Date Input",
          child: JpjoyDateInput(
            label: "Date of Birth",
            placeholder: "Select date",
            onChange: (date) => print(date),
          ),
        ),

        ComponentPreview(
          name: "Select (Dropdown)",
          child: JpjoySelect(
            label: "Country",
            options:  [
              SelectOption(label: "Thailand", value: "TH"),
              SelectOption(label: "Japan", value: "JP"),
              SelectOption(label: "USA", value: "US"),
            ],
            value: _selectedCountry,
            onChange: (val) {
              setState(() => _selectedCountry = val);
            },
          ),
        ),

        // --- 4. Segmented Control ---
        ComponentPreview(
          name: "Segmented Control",
          child: JpjoySegmentedControl(
            // ✅ ต้องส่งเป็น List<SegmentedControlOption>
            options:  [
              SegmentedControlOption(label: "Delivery", value: "Delivery"),
              SegmentedControlOption(label: "Pick Up", value: "Pick Up"),
            ],
            value: _selectedSegment,
            onChange: (val) { // ✅ แก้จาก onChanged เป็น onChange
              setState(() => _selectedSegment = val);
            },
          ),
        ),
      ],
    );
  }
}