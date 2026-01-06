import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/src/components/forms/button.dart';

class PriceSummary extends StatelessWidget {
  final double subtotal;
  final double shippingFee;
  final double discount;
  final VoidCallback onCheckout;
  final bool isLoading;

  const PriceSummary({
    super.key,
    required this.subtotal,
    required this.shippingFee,
    this.discount = 0,
    required this.onCheckout,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    final double total = subtotal + shippingFee - discount;
    final formatter = NumberFormat("#,###");

    return Container(
      padding: EdgeInsets.all(tokens.spaceMedium),
      decoration: BoxDecoration(
        color: tokens.colorSurfaceSecondary,
        borderRadius: BorderRadius.circular(tokens.radiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: tokens.fontWeightBold,
              color: tokens.colorTextPrimary,
            ),
          ),
          SizedBox(height: tokens.spaceDefault),

          _PriceRow(
            label: 'Subtotal',
            value: '฿${formatter.format(subtotal)}',
            textColor: tokens.colorTextSecondary,
            tokens: tokens,
          ),
          SizedBox(height: tokens.spaceSmall),
          _PriceRow(
            label: 'Shipping Fee',
            value: shippingFee == 0 ? 'Free' : '฿${formatter.format(shippingFee)}',
            textColor: tokens.colorTextSecondary,
            tokens: tokens,
          ),
          
          if (discount > 0) ...[
            SizedBox(height: tokens.spaceSmall),
            _PriceRow(
              label: 'Discount',
              value: '-฿${formatter.format(discount)}',
              textColor: tokens.colorStatusPositive,
              tokens: tokens,
            ),
          ],

          Padding(
            padding: EdgeInsets.symmetric(vertical: tokens.spaceSmall),
            child: Divider(color: tokens.colorBorderDefault, thickness: 1),
          ),

          _PriceRow(
            label: 'Total',
            value: '฿${formatter.format(total)}',
            textColor: tokens.colorTextPrimary,
            isBold: true,
            fontSize: 18,
            tokens: tokens,
          ),

          SizedBox(height: tokens.spaceMedium),

          // ✅ เปลี่ยนจาก ElevatedButton มาใช้ LookmixButton
          LookmixButton(
            fullWidth: true,
            size: ButtonSize.lg,
            appearance: ButtonAppearance.primary,
            loading: isLoading,
            onClick: onCheckout,
            children: const Text('PROCEED TO CHECKOUT'),
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final Color textColor;
  final bool isBold;
  final double fontSize;
  final dynamic tokens; // รับ tokens เพื่อใช้ค่า FontWeight

  const _PriceRow({
    required this.label,
    required this.value,
    required this.textColor,
    required this.tokens,
    this.isBold = false,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: isBold ? tokens.fontWeightBold : tokens.fontWeightRegular,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: isBold ? tokens.fontWeightBold : tokens.fontWeightRegular,
          ),
        ),
      ],
    );
  }
}