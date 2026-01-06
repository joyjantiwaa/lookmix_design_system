import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import '../component_preview.dart';

// ✅ Import พื้นฐาน
import 'package:lookmix_design_system/src/components/e_commerce/address_form.dart';
import 'package:lookmix_design_system/src/components/e_commerce/cart_item.dart';
import 'package:lookmix_design_system/src/components/e_commerce/cart_item_property.dart';
import 'package:lookmix_design_system/src/components/e_commerce/checkout_stepper.dart';
import 'package:lookmix_design_system/src/components/e_commerce/empty.dart';
import 'package:lookmix_design_system/src/components/e_commerce/order_status_timeline.dart';
import 'package:lookmix_design_system/src/components/e_commerce/price_summary.dart';
import 'package:lookmix_design_system/src/components/e_commerce/payment_method.dart';

// ✅ Import ส่วนที่เพิ่มใหม่
import 'package:lookmix_design_system/src/components/e_commerce/product_card.dart';
import 'package:lookmix_design_system/src/components/e_commerce/property_selector.dart';
import 'package:lookmix_design_system/src/components/e_commerce/property_option.dart';
import 'package:lookmix_design_system/src/components/e_commerce/quantity_stepper.dart';

class ECommerceStories extends StatefulWidget {
   ECommerceStories({super.key});

  @override
  State<ECommerceStories> createState() => _ECommerceStoriesState();
}

class _ECommerceStoriesState extends State<ECommerceStories> {
  // State สำหรับทดสอบ Selector & Stepper
  String selectedSize = "M";
  String selectedColor = "red";
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return ListView(
      padding: EdgeInsets.all(tokens.spaceMedium),
      children: [
        // --- 1. Product Display & Selection (NEW) ---
        Text("Product Display", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
         SizedBox(height: 16),
        
        ComponentPreview(
          name: "Product Card",
          child: Row(
            children: [
              Expanded(
                child: ProductCard(
                  id: "p1",
                  title: "คาร์ดิแกน ผ้าถักนิต แขนยาว",
                  price: 990,
                  discountPrice: 790,
                  imageUrl: "https://picsum.photos/400/500",
                  brand: "Lookmix",
                  tag: "Sale",
                  onAddToCart: (id) => print("Added $id to cart"),
                ),
              ),
               SizedBox(width: 16),
              Expanded(
                child: ProductCard(
                  id: "p2",
                  title: "กางเกงชิโน ทรงสลิม",
                  price: 1290,
                  imageUrl: "https://picsum.photos/400/501",
                  isOutOfStock: true,
                ),
              ),
            ],
          ),
        ),

        ComponentPreview(
          name: "Property Selectors",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PropertySelector(
                label: "Size",
                selectedValue: selectedSize,
                options:  [
                  PropertyOption(label: "S", value: "S"),
                  PropertyOption(label: "M", value: "M"),
                  PropertyOption(label: "L", value: "L"),
                  PropertyOption(label: "XL", value: "XL", disabled: true),
                ],
                onChange: (val) => setState(() => selectedSize = val),
              ),
               SizedBox(height: 20),
              PropertySelector(
                label: "Color",
                type: PropertySelectorType.color,
                selectedValue: selectedColor,
                options:  [
                  PropertyOption(label: "Red", value: "red", color: Colors.red),
                  PropertyOption(label: "Blue", value: "blue", color: Colors.blue),
                  PropertyOption(label: "Green", value: "green", color: Colors.green),
                ],
                onChange: (val) => setState(() => selectedColor = val),
              ),
            ],
          ),
        ),

        ComponentPreview(
          name: "Quantity Stepper",
          child: QuantityStepper(
            value: quantity,
            onChange: (val) => setState(() => quantity = val),
          ),
        ),

         Divider(height: 40),

        // --- 2. Checkout & Cart (Previous) ---
        Text("Checkout Flow", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
         SizedBox(height: 16),

        ComponentPreview(
          name: "Cart Item",
          child: CartItem(
            id: "c1",
            title: "Premium Hoodie",
            price: 1290,
            quantity: 1,
            image: "https://picsum.photos/200/300",
            properties:  [
              CartItemProperty(label: "Size", value: "L"),
              CartItemProperty(label: "Color", value: "Black"),
            ],
            onQuantityChange: (id, qty) => print("Qty: $qty"),
            onRemove: (id) => print("Remove $id"),
          ),
        ),

        ComponentPreview(
          name: "Price Summary",
          child: PriceSummary(
            subtotal: 1880,
            shippingFee: 50,
            discount: 100,
            onCheckout: () => print("Checkout"),
          ),
        ),

        ComponentPreview(
          name: "Order Status Timeline",
          child:  OrderStatusTimeline(
            events: [
              OrderEvent(
                status: "Delivered",
                timestamp: "14:20",
                description: "Your package has been delivered.",
                isCompleted: true,
              ),
              OrderEvent(
                status: "Processing",
                timestamp: "08:30",
                description: "We are preparing your order.",
                isCompleted: false,
              ),
            ],
          ),
        ),

        ComponentPreview(
          name: "Empty State",
          child: LookmixEmptyState(
            title: "Your cart is empty",
            description: "Start shopping to fill it up!",
            icon: Icons.shopping_basket_outlined,
            actionLabel: "GO TO SHOP",
            onAction: () => print("Go shop"),
          ),
        ),
      ],
    );
  }
}