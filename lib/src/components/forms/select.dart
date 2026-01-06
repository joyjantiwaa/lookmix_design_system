import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import '../../../tokens/tokens.dart';

class SelectOption {
  final String label;
  final dynamic value;
  const SelectOption({required this.label, required this.value});
}

class JpjoySelect extends StatefulWidget {
  final String? label;
  final List<SelectOption> options;
  final dynamic value;
  final ValueChanged<dynamic> onChange;
  final String? placeholder;
  final bool disabled;

  const JpjoySelect({
    super.key,
    this.label,
    required this.options,
    required this.value,
    required this.onChange,
    this.placeholder = 'Select an option',
    this.disabled = false,
  });

  @override
  State<JpjoySelect> createState() => _JpjoySelectState();
}

class _JpjoySelectState extends State<JpjoySelect> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    if (!widget.disabled) {
      setState(() => _isMenuOpen = !_isMenuOpen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light();
    
    // หา Label ของค่าที่เลือกอยู่
    final selectedOption = widget.options.cast<SelectOption?>().firstWhere(
      (opt) => opt?.value == widget.value,
      orElse: () => null,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: tokens.colorTextPrimary)),
          const SizedBox(height: 6),
        ],
        PortalTarget(
          visible: _isMenuOpen,
          anchor: const Aligned(
            follower: Alignment.topCenter,
            target: Alignment.bottomCenter,
            offset: Offset(0, 4),
          ),
          // --- ส่วนของ Menu (Dropdown) ---
          portalFollower: _buildMenu(context, tokens),
          // --- ส่วนของตัวเลือก (Trigger) ---
          child: GestureDetector(
            onTap: _toggleMenu,
            child: Opacity(
              opacity: widget.disabled ? 0.5 : 1.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: widget.disabled ? tokens.colorSurfaceTertiary : tokens.colorSurfaceBackground,
                  borderRadius: BorderRadius.circular(tokens.radiusSmall),
                  border: Border.all(color: _isMenuOpen ? tokens.colorPrimaryDefault : tokens.colorSurfaceTertiary),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedOption?.label ?? widget.placeholder ?? '',
                        style: TextStyle(
                          color: selectedOption != null ? tokens.colorTextPrimary : tokens.colorTextTertiary,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Icon(
                      _isMenuOpen ? Icons.expand_less : Icons.expand_more,
                      color: tokens.colorTextSecondary,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenu(BuildContext context, JpjoyTokens tokens) {
    return GestureDetector(
      onTap: () => setState(() => _isMenuOpen = false),
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          // พื้นหลังโปร่งใสกันคลิกทะลุ
          Positioned.fill(child: Container()),
          Container(
            width: MediaQuery.of(context).size.width, // หรือกำหนดความกว้างคงที่
            constraints: const BoxConstraints(maxHeight: 250, maxWidth: 400),
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(tokens.radiusSmall),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4)),
              ],
              border: Border.all(color: tokens.colorSurfaceTertiary),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(tokens.radiusSmall),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: widget.options.map((opt) {
                  final isSelected = opt.value == widget.value;
                  return InkWell(
                    onTap: () {
                      widget.onChange(opt.value);
                      setState(() => _isMenuOpen = false);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      color: isSelected ? tokens.colorPrimarySubtle : Colors.transparent,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              opt.label,
                              style: TextStyle(
                                color: isSelected ? tokens.colorPrimaryDefault : tokens.colorTextPrimary,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ),
                          if (isSelected)
                            Icon(Icons.check, size: 16, color: tokens.colorPrimaryDefault),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}