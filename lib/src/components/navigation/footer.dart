import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/src/components/forms/button.dart';
import 'package:lookmix_design_system/src/components/forms/icon_button.dart';

// ✅ Import ไอคอนจากไฟล์ในระบบของพี่ (เช็ค Path ให้ตรงนะครับ)
import 'package:lookmix_design_system/src/icon/bold/bold_icons.dart' as bold;

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = JpjoyThemeProvider.of(context);
    final tokens = theme.tokens;
    final bool isMobile = MediaQuery.of(context).size.width <= 768;

    return Container(
      color: tokens.colorSurfacePrimary,
      padding: EdgeInsets.symmetric(
        horizontal: tokens.spaceMedium, 
        vertical: tokens.spaceXl, 
      ),
      width: double.infinity,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: tokens.maxPageWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Download',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: tokens.fontWeightBold,
                  color: tokens.colorTextPrimary,
                ),
              ),
              SizedBox(height: tokens.spaceDefault),
              Wrap(
                spacing: tokens.spaceDefault,
                runSpacing: tokens.spaceDefault,
                children: [
                  _buildStoreButton(
                    context, 
                    label: 'App store', 
                    // ✅ ใช้ไอคอนจากไฟล์ระบบ
                    icon: const bold.AppleBoldIcon(), 
                  ),
                  _buildStoreButton(
                    context, 
                    label: 'Google play', 
                    // ✅ ใช้ไอคอนจากไฟล์ระบบ
                    icon: const bold.GooglePlayBoldIcon(), 
                  ),
                ],
              ),

              SizedBox(height: tokens.spaceLarge),
              Divider(color: tokens.colorBorderDefault, thickness: 1),
              SizedBox(height: tokens.spaceMedium),

              isMobile 
                ? _buildMobileBottom(context) 
                : _buildDesktopBottom(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreButton(BuildContext context, {required String label, required Widget icon}) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    return LookmixButton(
      // ✅ ใช้ appearance.outline เพื่อให้มีเส้นขอบตาม SCSS
      appearance: ButtonAppearance.outline, 
      size: ButtonSize.md,
      onClick: () {},
      children: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ✅ คุมขนาดไอคอนจากระบบ
          SizedBox(width: 20, height: 20, child: icon),
          SizedBox(width: tokens.spaceSmall),
          Text(label, style: TextStyle(color: tokens.colorTextPrimary)),
        ],
      ),
    );
  }

  Widget _buildDesktopBottom(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('© LY Corporation', 
              style: TextStyle(color: tokens.colorTextSecondary, fontSize: 12)),
            SizedBox(width: tokens.spaceLarge),
            _buildFooterLinks(context),
          ],
        ),
        _buildSocials(context),
      ],
    );
  }

  Widget _buildMobileBottom(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSocials(context),
        SizedBox(height: tokens.spaceMedium),
        _buildFooterLinks(context),
        SizedBox(height: tokens.spaceMedium),
        Text('© LY Corporation', 
          style: TextStyle(color: tokens.colorTextSecondary, fontSize: 12)),
      ],
    );
  }

  Widget _buildFooterLinks(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    return Wrap(
      spacing: tokens.spaceMedium,
      runSpacing: tokens.spaceSmall,
      children: [
        _FooterLink(label: 'Help', tokens: tokens),
        _FooterLink(label: 'User Agreement', tokens: tokens),
        _FooterLink(label: 'Privacy Policy', tokens: tokens),
      ],
    );
  }

  Widget _buildSocials(BuildContext context) {
    // ✅ เปลี่ยนมาใช้ IconButtonVariant.tertiary
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        JpjoyIconButton(
          icon: Icons.facebook,
          variant: IconButtonVariant.ghost,
          size: IconButtonSize.sm,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        JpjoyIconButton(
          icon: Icons.camera_alt,
          variant: IconButtonVariant.ghost,
          size: IconButtonSize.sm,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        JpjoyIconButton(
          icon: Icons.play_circle_fill,
          variant: IconButtonVariant.ghost,
          size: IconButtonSize.sm,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final dynamic tokens;
  const _FooterLink({required this.label, required this.tokens});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(tokens.radiusSmall),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12, 
          color: tokens.colorTextSecondary,
          fontWeight: tokens.fontWeightRegular,
        ),
      ),
    );
  }
}