import 'package:flutter/material.dart';
import '../../../tokens/tokens.dart';

class JpjoyInput extends StatefulWidget { // ✅ เปลี่ยนเป็น StatefulWidget เพื่อสลับค่าตา
  final String? id;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final String? value;
  final bool disabled;
  final bool readOnly;
  final String? error;
  final String? placeholder;
  final String? label;
  final bool isPassword;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final FocusNode? focusNode;

  const JpjoyInput({
    super.key,
    this.id,
    this.controller,
    this.onChange,
    this.value,
    this.disabled = false,
    this.readOnly = false,
    this.error,
    this.placeholder,
    this.label,
    this.isPassword = false,
    this.leadingIcon,
    this.trailingIcon,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.focusNode,
  });

  @override
  State<JpjoyInput> createState() => _JpjoyInputState();
}

class _JpjoyInputState extends State<JpjoyInput> {
  late bool _obscureText; // เก็บสถานะ ปิด/เปิด ตา

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword; // ถ้าเป็นรหัสผ่าน ให้เริ่มด้วยการปิดตา
  }

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light();
    final currentBorderColor = widget.error != null 
        ? tokens.colorStatusNegative 
        : tokens.colorSurfaceTertiary;

    final effectiveController = widget.controller ?? 
        (widget.value != null ? TextEditingController(text: widget.value) : null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: tokens.colorTextPrimary)),
          const SizedBox(height: 6),
        ],
        Opacity(
          opacity: widget.disabled ? 0.5 : 1.0,
          child: AbsorbPointer(
            absorbing: widget.disabled,
            child: TextField(
              controller: effectiveController,
              focusNode: widget.focusNode,
              onChanged: widget.onChange,
              readOnly: widget.readOnly,
              textAlign: widget.textAlign,
              obscureText: _obscureText, // ✅ ใช้ค่าจาก State
              keyboardType: widget.keyboardType,
              style: TextStyle(fontSize: 15, color: tokens.colorTextPrimary),
              cursorColor: tokens.colorPrimaryDefault,
              decoration: InputDecoration(
                isDense: true,
                hintText: widget.placeholder,
                hintStyle: TextStyle(color: tokens.colorTextTertiary),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                filled: true,
                fillColor: widget.disabled ? tokens.colorSurfaceTertiary : tokens.colorSurfaceBackground,
                prefixIcon: widget.leadingIcon != null 
                  ? Padding(padding: const EdgeInsets.only(left: 12, right: 8), child: IconTheme(data: IconThemeData(color: tokens.colorTextSecondary, size: 18), child: widget.leadingIcon!))
                  : null,
                
                // ✅ จัดการ Trailing Icon (ถ้าเป็น Password ให้ใส่ปุ่มตา)
                suffixIcon: widget.isPassword 
                  ? IconButton(
                      icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      iconSize: 18,
                      color: tokens.colorTextTertiary,
                      onPressed: () => setState(() => _obscureText = !_obscureText),
                    )
                  : (widget.trailingIcon != null 
                      ? Padding(padding: const EdgeInsets.only(left: 8, right: 12), child: IconTheme(data: IconThemeData(color: tokens.colorPrimaryDefault, size: 18), child: widget.trailingIcon!))
                      : null),
                
                suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(tokens.radiusSmall), borderSide: BorderSide(color: currentBorderColor)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(tokens.radiusSmall), borderSide: BorderSide(color: tokens.colorPrimaryDefault, width: 1.5)),
                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(tokens.radiusSmall), borderSide: BorderSide(color: tokens.colorStatusNegative)),
                focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(tokens.radiusSmall), borderSide: BorderSide(color: tokens.colorStatusNegative, width: 1.5)),
                errorStyle: const TextStyle(height: 0, fontSize: 0),
              ),
            ),
          ),
        ),
        if (widget.error != null) ...[
          const SizedBox(height: 4),
          Text(widget.error!, style: TextStyle(fontSize: 12, color: tokens.colorStatusNegative)),
        ],
      ],
    );
  }
}