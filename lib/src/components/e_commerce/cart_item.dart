import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart'; // ตรวจสอบ path นี้ให้ตรงนะครับ
import 'cart_item_property.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final double price;
  final int quantity;
  final List<CartItemProperty>? properties;
  final Function(String id, int quantity) onQuantityChange;
  final Function(String id) onRemove;

  const CartItem({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    this.properties,
    required this.onQuantityChange,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ ดึง Tokens ผ่าน Provider
    final tokens = JpjoyThemeProvider.of(context).tokens;
    final formatter = NumberFormat("#,###");

    return Container(
      padding: EdgeInsets.symmetric(vertical: tokens.spaceDefault),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: tokens.colorBorderDefault, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Image Container
          Container(
            width: 90,
            height: 120,
            decoration: BoxDecoration(
              color: tokens.colorSurfaceSecondary,
              borderRadius: BorderRadius.circular(tokens.radiusSmall),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.image_not_supported, color: tokens.colorTextTertiary),
            ),
          ),
          SizedBox(width: tokens.spaceDefault),

          // 2. Details Section
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: tokens.fontWeightRegular,
                                color: tokens.colorTextPrimary,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: () => onRemove(id),
                            child: Padding(
                              padding: EdgeInsets.all(tokens.spaceXs),
                              child: Icon(
                                Icons.delete_outline,
                                color: tokens.colorTextTertiary,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (properties != null && properties!.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: tokens.spaceXs),
                          child: Wrap(
                            spacing: tokens.spaceSmall,
                            children: properties!.map((p) => Text.rich(
                                  TextSpan(
                                    text: '${p.label}: ',
                                    children: [
                                      TextSpan(
                                        text: p.value,
                                        style: TextStyle(fontWeight: tokens.fontWeightRegular),
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: tokens.colorTextSecondary,
                                  ),
                                )).toList(),
                          ),
                        ),
                    ],
                  ),

                  // Footer: Price + Quantity Stepper
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center, // แก้ไขจาก alignItems เป็น crossAxisAlignment
                    children: [
                      Text(
                        '฿${formatter.format(price * quantity)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: tokens.fontWeightRegular,
                          color: tokens.colorTextPrimary,
                        ),
                      ),
                      _QuantityStepper(
                        value: quantity,
                        onChanged: (val) => onQuantityChange(id, val),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ ปรับ Stepper ให้ใช้ค่าจาก Tokens
class _QuantityStepper extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;
  const _QuantityStepper({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    return Row(
      children: [
        _StepperBtn(
          icon: Icons.remove, 
          onTap: value > 1 ? () => onChanged(value - 1) : null,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: tokens.spaceSmall),
          child: SizedBox(
            width: 24,
            child: Text(
              '$value', 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: tokens.fontWeightRegular,
                color: tokens.colorTextPrimary,
              )
            ),
          ),
        ),
        _StepperBtn(
          icon: Icons.add, 
          onTap: () => onChanged(value + 1),
        ),
      ],
    );
  }
}

class _StepperBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _StepperBtn({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(tokens.radiusSmall / 2),
      child: Container(
        padding: EdgeInsets.all(tokens.spaceXs),
        decoration: BoxDecoration(
          border: Border.all(color: tokens.colorBorderDefault),
          borderRadius: BorderRadius.circular(tokens.radiusSmall / 2),
          color: onTap == null ? tokens.colorSurfaceTertiary : null,
        ),
        child: Icon(
          icon, 
          size: 16, 
          color: onTap == null ? tokens.colorTextTertiary : tokens.colorTextPrimary,
        ),
      ),
    );
  }
}