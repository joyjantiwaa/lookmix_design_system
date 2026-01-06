import 'package:flutter/material.dart';
import '../../theme/jpjoy_theme_provider.dart';
import '../forms/button.dart'; 

class LookmixEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  final String? actionLabel;
  final VoidCallback? onAction;
  final EdgeInsetsGeometry? padding;

  const LookmixEmptyState({
    super.key,
    // Default: mingcute:box-line fallback
    this.icon = Icons.inventory_2_outlined,
    required this.title,
    this.description,
    this.actionLabel,
    this.onAction,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ ดึงค่า Tokens ผ่าน Provider
    final themeProvider = JpjoyThemeProvider.of(context);
    final tokens = themeProvider.tokens;

    return Container(
      width: double.infinity,
      // SCSS: padding: var(--spacing-xxl) var(--spacing-large);
      padding: padding ?? EdgeInsets.symmetric(
        vertical: tokens.spaceXxl, 
        horizontal: tokens.spaceLarge
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Icon Wrapper
          // SCSS: .iconWrapper { margin-bottom: var(--spacing-medium); opacity: 0.6; }
          Padding(
            padding: EdgeInsets.only(bottom: tokens.spaceMedium),
            child: Opacity(
              opacity: 0.6,
              child: Icon(
                icon,
                size: 64,
                color: tokens.colorTextTertiary,
              ),
            ),
          ),

          // 2. Title (Heading h4)
          // SCSS: .title { margin-bottom: var(--spacing-xs) }
          Padding(
            padding: EdgeInsets.only(bottom: tokens.spaceXs),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20, // typography-sizes-heading-h4
                fontWeight: tokens.fontWeightBold,
                color: tokens.colorTextPrimary,
                height: 1.2,
              ),
            ),
          ),

          // 3. Description (Paragraph secondary)
          // SCSS: .description { max-width: 320px; margin-bottom: var(--spacing-large); }
          if (description != null)
            Padding(
              padding: EdgeInsets.only(bottom: tokens.spaceLarge),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 320),
                child: Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: tokens.colorTextSecondary,
                    height: 1.5,
                  ),
                ),
              ),
            ),

          // 4. Action Button
          // SCSS: .action { min-width: 160px; }
          if (actionLabel != null && onAction != null)
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 160),
              child: LookmixButton(
                appearance: ButtonAppearance.primary,
                onClick: onAction,
                children: Text(actionLabel!),
              ),
            ),
        ],
      ),
    );
  }
}