import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_portal/flutter_portal.dart'; // ตัวจัดการ Floating UI
import '../../../tokens/tokens.dart';
import 'text_input.dart';

class JpjoyDateInput extends StatefulWidget {
  final String? label;
  final String? value;
  final ValueChanged<String>? onChange;
  final String placeholder;

  const JpjoyDateInput({
    super.key,
    this.label,
    this.value,
    this.onChange,
    this.placeholder = 'Select date',
  });

  @override
  State<JpjoyDateInput> createState() => _JpjoyDateInputState();
}

class _JpjoyDateInputState extends State<JpjoyDateInput> {
  bool _isCalendarOpen = false;

  void _toggleCalendar() => setState(() => _isCalendarOpen = !_isCalendarOpen);

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light();

    return PortalTarget(
      visible: _isCalendarOpen,
      // การวางตำแหน่งปฏิทิน (เหมือน placement: 'bottom-start' ของ floating-ui)
      anchor: const Aligned(
        follower: Alignment.topLeft,
        target: Alignment.bottomLeft,
        offset: Offset(0, 4),
      ),
      // ส่วนของ Floating (Calendar)
      portalFollower: GestureDetector(
        onTap: _toggleCalendar, // ปิดเมื่อกดข้างนอก (หากหุ้ม Backdrop)
        child: _buildCalendarOverlay(tokens),
      ),
      // ส่วนของ Reference (Input)
      child: GestureDetector(
        onTap: _toggleCalendar,
        child: AbsorbPointer( // บังคับให้คลิกผ่านเข้าไปหา GestureDetector
          child: JpjoyInput(
            label: widget.label,
            value: widget.value,
            placeholder: widget.placeholder,
            readOnly: true, // เหมือนใน React
            textAlign: TextAlign.center, // ตาม scss: text-align: center
            trailingIcon: Icon(
              Icons.calendar_month_outlined,
              color: tokens.colorPrimaryDefault,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarOverlay(JpjoyTokens tokens) {
    return Material(
      elevation: 8,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(tokens.radiusMedium), // 12px
      child: Container(
        width: 300, // บังคับความกว้างขั้นต่ำตาม React code
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: tokens.colorSurfaceBackground,
          border: Border.all(color: tokens.colorPrimarySubtle),
          borderRadius: BorderRadius.circular(tokens.radiusMedium),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: tokens.colorPrimaryDefault,
              onPrimary: Colors.white,
              surface: tokens.colorSurfaceBackground,
            ),
          ),
          child: CalendarDatePicker(
            initialDate: DateTime.tryParse(widget.value ?? '') ?? DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now().add(const Duration(days: 3650)),
            onDateChanged: (date) {
              final formatted = DateFormat('yyyy-MM-dd').format(date);
              widget.onChange?.call(formatted);
              _toggleCalendar(); // เลือกแล้วปิดเลย
            },
          ),
        ),
      ),
    );
  }
}