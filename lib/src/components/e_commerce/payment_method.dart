import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/tokens/tokens.dart';

enum PaymentType { credit, transfer, cod }

class PaymentMethod extends StatefulWidget {
  final Function(PaymentType) onSelect;

  const PaymentMethod({super.key, required this.onSelect});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  PaymentType _selected = PaymentType.credit;

  void _handleSelect(PaymentType type) {
    setState(() => _selected = type);
    widget.onSelect(type);
  }

  @override
  Widget build(BuildContext context) {
    // ✅ ดึง Tokens จาก Provider
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: tokens.spaceMedium), // spaceMedium (24.0)
          child: Text(
            'Payment Method',
            style: TextStyle(
              fontSize: 18,
              fontWeight: tokens.fontWeightBold,
              color: tokens.colorTextPrimary,
            ),
          ),
        ),
        _buildMethodItem(
          tokens: tokens,
          type: PaymentType.credit,
          icon: Icons.credit_card_outlined,
          title: 'Credit / Debit Card',
          subtitle: 'Visa, Mastercard, JCB',
          isActive: _selected == PaymentType.credit,
        ),
        SizedBox(height: tokens.spaceSmall), // spaceSmall (8.0) หรือ spaceDefault (12.0/16.0)
        _buildMethodItem(
          tokens: tokens,
          type: PaymentType.transfer,
          icon: Icons.qr_code_scanner,
          title: 'Bank Transfer',
          subtitle: 'QR PromptPay, Mobile Banking',
          isActive: _selected == PaymentType.transfer,
        ),
        SizedBox(height: tokens.spaceSmall),
        _buildMethodItem(
          tokens: tokens,
          type: PaymentType.cod,
          icon: Icons.local_shipping_outlined,
          title: 'Cash on Delivery',
          subtitle: 'Pay when you receive',
          isActive: _selected == PaymentType.cod,
        ),
      ],
    );
  }

  Widget _buildMethodItem({
    required JpjoyTokens tokens,
    required PaymentType type,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isActive,
  }) {
    return AnimatedContainer(
      duration: tokens.durationFast, // ใช้ duration จาก tokens (150ms)
      curve: tokens.easingDefault,
      decoration: BoxDecoration(
        // ✅ เปลี่ยนพื้นหลังตามสถานะ Active และ Theme
        color: isActive 
            ? tokens.colorPrimarySubtle 
            : tokens.colorSurfacePrimary,
        borderRadius: BorderRadius.circular(tokens.radiusSmall), // radiusSmall (8.0)
        border: Border.all(
          color: isActive ? tokens.colorPrimaryDefault : tokens.colorBorderDefault,
          width: 1.5,
        ),
        // ✅ เพิ่มเงาบางๆ เมื่อไม่ได้เลือกเพื่อให้ดูมีมิติ
        boxShadow: isActive ? null : tokens.shadowXs,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleSelect(type),
          borderRadius: BorderRadius.circular(tokens.radiusSmall),
          child: Padding(
            padding: EdgeInsets.all(tokens.spaceDefault), // spaceDefault (16.0)
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(tokens.spaceXs),
                  decoration: BoxDecoration(
                    color: isActive ? tokens.colorPrimaryDefault : tokens.colorSurfaceSecondary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: isActive ? tokens.colorTextInverse : tokens.colorTextSecondary,
                  ),
                ),
                SizedBox(width: tokens.spaceDefault),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: tokens.fontWeightSemiBold,
                          color: tokens.colorTextPrimary,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: tokens.colorTextTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
                // ✅ เพิ่ม Radio Indicator เล็กๆ เพื่อความชัดเจน
                Icon(
                  isActive ? Icons.check_circle : Icons.circle_outlined,
                  size: 20,
                  color: isActive ? tokens.colorPrimaryDefault : tokens.colorBorderDefault,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}