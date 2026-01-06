import 'package:flutter/material.dart';
// ✅ นำเข้า Tokens เพื่อใช้มาตรฐานเดียวกันทั้งแอป
import '../../../tokens/tokens.dart';

enum CardVariant { defaultVariant, glass, compact }

class CardWidget extends StatelessWidget {
  final Widget? child;
  final String? title;
  final Widget? header;
  final Widget? footer;
  final String? image;
  final String? imageAlt;
  final CardVariant variant;
  final bool interactive;
  final VoidCallback? onClick;

  const CardWidget({
    super.key, // ใช้ super.key
    this.child,
    this.title,
    this.header,
    this.footer,
    this.image,
    this.imageAlt,
    this.variant = CardVariant.defaultVariant,
    this.interactive = false,
    this.onClick,
  });

  // ✅ ใช้ Spacing Tokens
  double _getPadding(JpjoyTokens tokens) {
    switch (variant) {
      case CardVariant.compact:
        return tokens.spaceSmall;
      default:
        return tokens.spaceDefault;
    }
  }

  double _getBorderRadius(JpjoyTokens tokens) {
    switch (variant) {
      case CardVariant.compact:
        return tokens.radiusMedium;
      default:
        return tokens.radiusLarge;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light();
    final padding = _getPadding(tokens);
    final borderRadius = _getBorderRadius(tokens);

    // สร้างเนื้อหา Card
    Widget cardContent = Container(
      decoration: BoxDecoration(
        color: variant == CardVariant.glass 
            ? Colors.white.withOpacity(0.7) 
            : tokens.colorSurfaceBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(variant == CardVariant.glass ? 0.05 : 0.1),
            blurRadius: variant == CardVariant.glass ? 16 : 6,
            offset: const Offset(0, 4),
          )
        ],
        border: variant == CardVariant.glass
            ? Border.all(color: Colors.white.withOpacity(0.5), width: 1.5)
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
              child: Image.network(
                image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180, // กำหนดความสูงมาตรฐานเพื่อให้ Layout นิ่ง
              ),
            ),
          if (header != null)
            Padding(
              padding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
              child: header,
            ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      title!,
                      // ✅ แก้ไขจาก headline6 เป็น titleLarge
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: tokens.colorTextPrimary,
                          ),
                    ),
                  ),
                if (child != null) child!,
              ],
            ),
          ),
          if (footer != null)
            Padding(
              padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
              child: footer,
            ),
        ],
      ),
    );

    // ถ้า interactive เป็น true ให้ใส่ Feedback เวลาเอาเมาส์จิ้ม
    if (!interactive) return cardContent;

    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(borderRadius),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: cardContent,
      ),
    );
  }
}