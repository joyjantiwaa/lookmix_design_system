import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/src/components/e_commerce/order_status_timeline.dart'; // ตรวจสอบ path นะครับ

class ThemeGallery extends StatelessWidget {
  const ThemeGallery({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. ดึง Tokens มาจาก Provider เพื่อให้รองรับการเปลี่ยน Theme
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return Scaffold(
      backgroundColor: tokens.colorSurfaceBackground,
      appBar: AppBar(
        title: const Text('Order Tracking Gallery'),
        backgroundColor: tokens.colorSurfacePrimary,
        foregroundColor: tokens.colorTextPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(tokens.spaceMedium),
        children: [
          _buildHeader(tokens, "ORDER TRACKING"),

          // --- Section: Timeline Showcase ---
          _buildVariantLabel(tokens, "Order Tracking Timeline"),
          
          Container(
            padding: EdgeInsets.all(tokens.spaceMedium),
            decoration: BoxDecoration(
              color: tokens.colorSurfacePrimary,
              borderRadius: BorderRadius.circular(tokens.radiusMedium),
              border: Border.all(color: tokens.colorBorderDefault),
              boxShadow: tokens.shadowSmall,
            ),
            child: const OrderStatusTimeline(
              events: [
                OrderEvent(
                  status: "Delivered",
                  timestamp: "Today, 14:20",
                  description: "Package has been delivered to the receptionist.",
                  isCompleted: true,
                ),
                OrderEvent(
                  status: "Out for Delivery",
                  timestamp: "Today, 09:00",
                  description: "Driver is heading to your location.",
                  isCompleted: true,
                ),
                OrderEvent(
                  status: "Package Arrived",
                  timestamp: "Yesterday, 18:30",
                  description: "Package arrived at the local sorting hub.",
                  isCompleted: false,
                ),
              ],
            ),
          ),
          
          SizedBox(height: tokens.spaceXl),
          
          // ตัวอย่างสถานะแบบสั้น (Single Item)
          _buildVariantLabel(tokens, "Recent Activity (Single Event)"),
          Container(
            padding: EdgeInsets.all(tokens.spaceDefault),
            decoration: BoxDecoration(
              color: tokens.colorSurfaceSecondary,
              borderRadius: BorderRadius.circular(tokens.radiusSmall),
            ),
            child: const OrderStatusTimeline(
              events: [
                OrderEvent(
                  status: "Order Placed",
                  timestamp: "Jan 5, 2026",
                  description: "We have received your order.",
                  isCompleted: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper สำหรับสร้าง Header ของกลุ่มคอมโพเนนต์
  Widget _buildHeader(dynamic tokens, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: tokens.spaceMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: tokens.fontWeightBold,
              color: tokens.colorTextPrimary,
              letterSpacing: -0.5,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: tokens.colorPrimaryDefault,
              borderRadius: BorderRadius.circular(tokens.radiusPill),
            ),
          ),
        ],
      ),
    );
  }

  // Helper สำหรับสร้าง Label กำกับแต่ละ Variant
  Widget _buildVariantLabel(dynamic tokens, String label) {
    return Padding(
      padding: EdgeInsets.only(top: tokens.spaceLarge, bottom: tokens.spaceSmall),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: tokens.fontWeightBold,
          color: tokens.colorTextTertiary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}