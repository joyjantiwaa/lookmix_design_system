import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

// ✅ Import ระบบ Tokens และ Badge ตามโครงสร้างโปรเจกต์ของพี่
import '../../../tokens/tokens.dart';
import '../data_display/badge.dart';

class ProductCard extends StatefulWidget {
  final String id;
  final String title;
  final double price;
  final double? discountPrice;
  final String imageUrl;
  final String? brand;
  final String? tag;
  final bool isOutOfStock;
  final VoidCallback? onTap;
  final Function(String)? onAddToCart;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    this.discountPrice,
    required this.imageUrl,
    this.brand,
    this.tag,
    this.isOutOfStock = false,
    this.onTap,
    this.onAddToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // ✅ เรียกใช้ Tokens (แนะนำให้ใช้ JpjoyTokens.light() หรือดึงจาก Provider)
    final tokens = JpjoyTokens.light();
    
    final hasDiscount = widget.discountPrice != null && widget.discountPrice! < widget.price;
    final formatter = NumberFormat("#,###");

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: tokens.durationMedium,
          curve: tokens.easingDefault,
          transform: _isHovered && !widget.isOutOfStock
              ? (Matrix4.identity()..translate(0, -4))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: tokens.colorSurfacePrimary,
            borderRadius: BorderRadius.circular(tokens.radiusMedium),
            // ✅ ใช้ Shadow จาก Tokens ระบบ
            boxShadow: _isHovered && !widget.isOutOfStock
                ? tokens.shadowLarge
                : tokens.shadowSmall,
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. ส่วนรูปภาพ (Image & Badges) ---
              AspectRatio(
                aspectRatio: 3 / 4,
                child: Stack(
                  children: [
                    Container(color: tokens.colorSurfaceSecondary),
                    Positioned.fill(
                      child: AnimatedScale(
                        duration: tokens.durationSlow,
                        scale: _isHovered && !widget.isOutOfStock ? 1.05 : 1.0,
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                          // กรณีรูปโหลดไม่ขึ้น
                          errorBuilder: (context, error, stackTrace) => 
                              Center(child: Icon(Icons.broken_image, color: tokens.colorTextTertiary)),
                        ),
                      ),
                    ),

                    // ✅ การใช้ Badge ที่เชื่อมกับระบบ Tokens
                    if (widget.tag != null)
                      Positioned(
                        top: tokens.spaceSmall,
                        left: tokens.spaceSmall,
                        child: LookmixBadge(
                          content: widget.tag,
                          variant: widget.tag!.toLowerCase() == 'sale' 
                              ? BadgeVariant.danger 
                              : BadgeVariant.primary,
                          size: BadgeSize.sm,
                        ),
                      ),

                    // ✅ Out of Stock Overlay พร้อม Glassmorphism
                    if (widget.isOutOfStock)
                      Positioned.fill(
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: tokens.blurDefault, sigmaY: tokens.blurDefault),
                            child: Container(
                              color: tokens.colorSurfacePrimary.withOpacity(0.6),
                              child: Center(
                                child: Transform.rotate(
                                  angle: -10 * (3.14159 / 180),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: tokens.spaceDefault, 
                                        vertical: tokens.spaceSmall),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: tokens.colorTextPrimary, width: 2),
                                    ),
                                    child: Text(
                                      'OUT OF STOCK',
                                      style: TextStyle(
                                          fontWeight: tokens.fontWeightBold, 
                                          color: tokens.colorTextPrimary),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    // ✅ Quick Add Button (แก้ Bug IconButton styleFrom)
                    if (!widget.isOutOfStock && widget.onAddToCart != null)
                      Positioned(
                        bottom: tokens.spaceSmall,
                        right: tokens.spaceSmall,
                        child: AnimatedOpacity(
                          duration: tokens.durationFast,
                          opacity: _isHovered ? 1.0 : 0.0,
                          child: AnimatedContainer(
                            duration: tokens.durationFast,
                            transform: Matrix4.identity()
                              ..translate(0, _isHovered ? 0.0 : 8.0),
                            child: IconButton(
                              onPressed: () => widget.onAddToCart!(widget.id),
                              icon: const Icon(Icons.shopping_cart_outlined),
                              style: IconButton.styleFrom(
                                // ใช้สีพื้นฐานเมื่อไม่ชี้ และเปลี่ยนสีเมื่อชี้ (Dynamic Style)
                                backgroundColor: _isHovered 
                                    ? tokens.colorPrimaryDefault 
                                    : tokens.colorSurfacePrimary,
                                foregroundColor: _isHovered 
                                    ? tokens.colorTextInverse 
                                    : tokens.colorTextPrimary,
                                elevation: 4,
                                // กำหนดความเร็วในการเปลี่ยนสีปุ่ม
                                animationDuration: tokens.durationFast,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // --- 2. ส่วนข้อมูลสินค้า (Content) ---
              Padding(
                padding: EdgeInsets.all(tokens.spaceSmall + 4), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.brand != null)
                      Text(
                        widget.brand!.toUpperCase(),
                        style: TextStyle(
                          color: tokens.colorTextTertiary,
                          fontSize: 10,
                          fontWeight: tokens.fontWeightSemiBold,
                          letterSpacing: tokens.letterSpacingWide,
                        ),
                      ),
                    SizedBox(height: tokens.spaceXs),
                    Text(
                      widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: tokens.fontWeightMedium,
                        color: tokens.colorTextPrimary,
                        height: tokens.lineHeightBase,
                      ),
                    ),
                    SizedBox(height: tokens.spaceSmall),
                    
                    // --- ส่วนแสดงราคา ---
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (hasDiscount) ...[
                          Text(
                            '฿${formatter.format(widget.discountPrice)}',
                            style: TextStyle(
                              color: tokens.colorStatusNegative, 
                              fontWeight: tokens.fontWeightBold, 
                              fontSize: 18
                            ),
                          ),
                          SizedBox(width: tokens.spaceSmall),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              '฿${formatter.format(widget.price)}',
                              style: TextStyle(
                                color: tokens.colorTextTertiary,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ] else
                          Text(
                            '฿${formatter.format(widget.price)}',
                            style: TextStyle(
                              fontWeight: tokens.fontWeightBold, 
                              fontSize: 18, 
                              color: tokens.colorTextPrimary
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}