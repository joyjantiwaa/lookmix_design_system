import 'package:flutter/material.dart';
import '../../../tokens/tokens.dart';

enum BannerVariant { hero, promotional, alert }
enum BannerAlign { left, center, right }

class LookmixBanner extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final String? ctaText;
  final VoidCallback? onCtaClick;
  final Widget? action;
  final String? backgroundImage;
  final String? foregroundImage;
  final BannerVariant variant;
  final BannerAlign align;
  final bool overlay;
  final bool inverse;
  final Widget? child;

  const LookmixBanner({
    super.key,
    this.title,
    this.subtitle,
    this.ctaText,
    this.onCtaClick,
    this.action,
    this.backgroundImage,
    this.foregroundImage,
    this.variant = BannerVariant.hero,
    this.align = BannerAlign.center,
    this.overlay = false,
    this.inverse = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light(); 
    final isAlert = variant == BannerVariant.alert;

    Widget? actionContent;
    if (action != null) {
      actionContent = action;
    } else if (ctaText != null) {
      actionContent = ElevatedButton(
        onPressed: onCtaClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: inverse 
              ? tokens.colorSurfaceBackground 
              : tokens.colorPrimaryDefault,
          foregroundColor: inverse 
              ? tokens.colorTextPrimary 
              : tokens.colorTextInverse,
          elevation: 0,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: Text(ctaText!, style: const TextStyle(fontWeight: FontWeight.bold)),
      );
    }

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: variant == BannerVariant.hero 
            ? MediaQuery.of(context).size.height * 0.6 
            : (variant == BannerVariant.promotional ? 300 : 0),
      ),
      decoration: BoxDecoration(
        color: isAlert ? tokens.colorSurfaceSecondary : tokens.colorSurfaceBackground,
        borderRadius: variant == BannerVariant.hero 
            ? BorderRadius.zero 
            : BorderRadius.circular(tokens.radiusMedium),
        // ✅ แก้ไข: ใช้ colorTextSecondary แทนตัวที่ไม่มีในไฟล์ Tokens
        border: isAlert 
            ? Border.all(color: tokens.colorTextSecondary.withOpacity(0.2)) 
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (backgroundImage != null) ...[
            Positioned.fill(child: Image.network(backgroundImage!, fit: BoxFit.cover)),
            if (overlay) Positioned.fill(child: Container(color: Colors.black.withOpacity(0.4))),
          ],
          Padding(
            padding: _getPadding(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: _getCrossAxisAlignment(),
              children: [
                _buildTextSection(tokens),
                if (actionContent != null) 
                  Padding(padding: const EdgeInsets.only(top: 24), child: actionContent),
                if (child != null) child!,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextSection(JpjoyTokens tokens) {
    return Column(
      crossAxisAlignment: _getCrossAxisAlignment(),
      children: [
        if (title != null)
          DefaultTextStyle(
            style: TextStyle(
              fontSize: variant == BannerVariant.hero ? 48 : 24,
              fontWeight: FontWeight.bold,
              color: inverse ? tokens.colorTextInverse : tokens.colorTextPrimary,
            ),
            child: title!,
          ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                color: inverse ? tokens.colorTextInverse.withOpacity(0.9) : tokens.colorTextSecondary,
              ),
              child: subtitle!,
            ),
          ),
      ],
    );
  }

  CrossAxisAlignment _getCrossAxisAlignment() {
    if (align == BannerAlign.left) return CrossAxisAlignment.start;
    if (align == BannerAlign.right) return CrossAxisAlignment.end;
    return CrossAxisAlignment.center;
  }

  EdgeInsets _getPadding() {
    if (variant == BannerVariant.hero) return const EdgeInsets.all(64);
    if (variant == BannerVariant.promotional) return const EdgeInsets.all(48);
    return const EdgeInsets.all(24);
  }
}