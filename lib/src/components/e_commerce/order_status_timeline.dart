import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/src/components/e_commerce/order_event.dart';

// ✅ Model สำหรับข้อมูล Event
class OrderEvent {
  final String status;
  final String timestamp;
  final String description;
  final bool isCompleted;

  const OrderEvent({
    required this.status,
    required this.timestamp,
    required this.description,
    this.isCompleted = false,
  });
}

class OrderStatusTimeline extends StatelessWidget {
  final List<OrderEvent> events;

  const OrderStatusTimeline({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    // ✅ ดึง Tokens ผ่าน Provider
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return Column(
      children: events.asMap().entries.map((entry) {
        int index = entry.key;
        OrderEvent event = entry.value;
        bool isLast = index == events.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- 1. Indicator Section (Dot & Line) ---
              SizedBox(
                width: tokens.spaceMedium, // ใช้ spaceMedium (24.0)
                child: Column(
                  children: [
                    // Dot (จุดสถานะ)
                    AnimatedContainer(
                      duration: tokens.durationMedium, // ใช้ 300ms จาก tokens
                      width: 20, // ปรับขนาดให้สมดุลกับเส้น
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: event.isCompleted 
                            ? tokens.colorPrimaryDefault 
                            : tokens.colorSurfaceSecondary,
                        border: Border.all(
                          color: event.isCompleted 
                              ? tokens.colorPrimaryDefault 
                              : tokens.colorBorderDefault,
                          width: 2,
                        ),
                      ),
                      child: event.isCompleted
                          ? Icon(Icons.check, size: 12, color: tokens.colorTextInverse)
                          : null,
                    ),
                    // Line (เส้นเชื่อม)
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          color: event.isCompleted 
                              ? tokens.colorPrimaryDefault 
                              : tokens.colorBorderDefault,
                        ),
                      ),
                  ],
                ),
              ),
              
              SizedBox(width: tokens.spaceDefault), // spaceDefault (16.0)

              // --- 2. Content Section ---
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: isLast ? 0 : tokens.spaceMedium // spaceMedium (24.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header: Status & Time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            event.status,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: event.isCompleted 
                                  ? tokens.fontWeightBold 
                                  : tokens.fontWeightSemiBold,
                              color: event.isCompleted 
                                  ? tokens.colorTextPrimary 
                                  : tokens.colorTextTertiary,
                            ),
                          ),
                          Text(
                            event.timestamp,
                            style: TextStyle(
                              fontSize: 12,
                              color: tokens.colorTextTertiary,
                              fontWeight: tokens.fontWeightRegular,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Description
                      Text(
                        event.description,
                        style: TextStyle(
                          fontSize: 13,
                          color: tokens.colorTextSecondary,
                          height: tokens.lineHeightBase, // ใช้ 1.5 จาก tokens
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}