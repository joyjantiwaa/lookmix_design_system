import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/tokens/tokens.dart';
// ✅ Import LookmixButton เข้ามาใช้งาน
import 'package:lookmix_design_system/src/components/forms/button.dart';

class AddressForm extends StatefulWidget {
  final Function(Map<String, String>) onSubmit;
  final bool isSubmitting; // เพิ่มเพื่อรองรับสถานะ loading

  const AddressForm({
    super.key, 
    required this.onSubmit,
    this.isSubmitting = false,
  });

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'address': TextEditingController(),
    'postalCode': TextEditingController(),
    'phone': TextEditingController(),
  };

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ ดึง Tokens จาก Provider เพื่อรองรับ Dark/Light Mode
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return Container(
      padding: EdgeInsets.all(tokens.spaceMedium), // เปลี่ยนเป็นค่าจาก tokens (24.0)
      decoration: BoxDecoration(
        color: tokens.colorSurfacePrimary,
        borderRadius: BorderRadius.circular(tokens.radiusMedium),
        border: Border.all(color: tokens.colorBorderDefault), // ใช้ colorBorderDefault แทน
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Address',
              style: TextStyle(
                fontSize: 18,
                fontWeight: tokens.fontWeightBold, // ใช้จาก tokens
                color: tokens.colorTextPrimary,
              ),
            ),
            SizedBox(height: tokens.spaceMedium),
            
            LayoutBuilder(
              builder: (context, constraints) {
                final bool isTablet = constraints.maxWidth >= 480;
                return Column(
                  children: [
                    _buildResponsiveRow(
                      isTablet: isTablet,
                      tokens: tokens,
                      children: [
                        _buildField(
                          tokens: tokens,
                          label: 'First Name',
                          placeholder: 'John',
                          controller: _controllers['firstName']!,
                        ),
                        _buildField(
                          tokens: tokens,
                          label: 'Last Name',
                          placeholder: 'Doe',
                          controller: _controllers['lastName']!,
                        ),
                      ],
                    ),
                    SizedBox(height: tokens.spaceDefault),
                    _buildField(
                      tokens: tokens,
                      label: 'Address',
                      placeholder: 'House No, Street...',
                      controller: _controllers['address']!,
                      maxLines: 3,
                    ),
                    SizedBox(height: tokens.spaceDefault),
                    _buildResponsiveRow(
                      isTablet: isTablet,
                      tokens: tokens,
                      children: [
                        _buildField(
                          tokens: tokens,
                          label: 'Postal Code',
                          placeholder: '10110',
                          controller: _controllers['postalCode']!,
                          keyboardType: TextInputType.number,
                        ),
                        _buildField(
                          tokens: tokens,
                          label: 'Phone Number',
                          placeholder: '08x-xxx-xxxx',
                          controller: _controllers['phone']!,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            
            SizedBox(height: tokens.spaceLarge),
            
            // ✅ เปลี่ยนมาใช้ LookmixButton
            LookmixButton(
              fullWidth: true,
              size: ButtonSize.lg,
              loading: widget.isSubmitting,
              onClick: () {
                if (_formKey.currentState!.validate()) {
                  final data = _controllers.map(
                    (key, controller) => MapEntry(key, controller.text)
                  );
                  widget.onSubmit(data);
                }
              },
              children: const Text('CONTINUE TO PAYMENT'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper สำหรับ Input Field
  Widget _buildField({
    required JpjoyTokens tokens,
    required String label,
    required String placeholder,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: tokens.fontSizeCaptionMedium, // ใช้จาก tokens
            fontWeight: tokens.fontWeightMedium,
            color: tokens.colorTextSecondary,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: TextStyle(color: tokens.colorTextPrimary, fontSize: 14),
          decoration: InputDecoration(
            isDense: true,
            hintText: placeholder,
            hintStyle: TextStyle(color: tokens.colorTextTertiary, fontSize: 14),
            filled: true,
            fillColor: tokens.colorSurfacePrimary,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(tokens.radiusSmall),
              borderSide: BorderSide(color: tokens.colorBorderDefault), 
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(tokens.radiusSmall),
              borderSide: BorderSide(color: tokens.colorPrimaryDefault, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
        ),
      ],
    );
  }

  Widget _buildResponsiveRow({
    required bool isTablet, 
    required List<Widget> children,
    required JpjoyTokens tokens,
  }) {
    if (isTablet) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children.map((child) => Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: child == children.last ? 0 : tokens.spaceDefault),
            child: child,
          ),
        )).toList(),
      );
    }
    return Column(
      children: [
        children[0], 
        SizedBox(height: tokens.spaceDefault), 
        children[1]
      ]
    );
  }
}