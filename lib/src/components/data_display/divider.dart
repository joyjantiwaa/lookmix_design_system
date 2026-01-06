import 'package:flutter/material.dart';

enum DividerOrientation { horizontal, vertical }
enum DividerType { solid, dashed, dotted }
enum DividerTextAlign { left, center, right }

class DividerWidget extends StatelessWidget {
  final DividerOrientation orientation;
  final DividerType type;
  final Widget? child;
  final DividerTextAlign textAlign;
  final Color? color;
  final double thickness;
  final EdgeInsets? margin;

  const DividerWidget({
    super.key, // ✅ แก้เป็น super.key (ลดความเยิ่นเย้อ)
    this.orientation = DividerOrientation.horizontal,
    this.type = DividerType.solid,
    this.child,
    this.textAlign = DividerTextAlign.center,
    this.color,
    this.thickness = 1.0,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ ใช้ ?? Colors.grey เพื่อเลี่ยงค่า null
    final dividerColor = color ?? Colors.grey[300]!;

    if (orientation == DividerOrientation.vertical) {
      return Container(
        width: thickness,
        height: 24,
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: dividerColor,
              width: thickness,
              style: _mapType(),
            ),
          ),
        ),
      );
    }

    // Horizontal
    if (child != null) {
      Widget line = Expanded(
        child: Container(
          height: thickness,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: dividerColor,
                width: thickness,
                style: _mapType(),
              ),
            ),
          ),
        ),
      );

      List<Widget> childrenList;
      // ✅ ลบ default: ออก และใส่ case ให้ครบตามที่ Analyze แจ้งเตือน
      switch (textAlign) {
        case DividerTextAlign.left:
          childrenList = [child!, const SizedBox(width: 8), line];
          break;
        case DividerTextAlign.right:
          childrenList = [line, const SizedBox(width: 8), child!];
          break;
        case DividerTextAlign.center:
          childrenList = [line, const SizedBox(width: 8), child!, const SizedBox(width: 8), line];
          break;
      }

      return Container(
        margin: margin ?? const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: childrenList, // ✅ ย้ายมาไว้หลังสุดตามกฎ sort_child_properties_last
        ),
      );
    }

    return Container(
      height: thickness,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 16),
      color: type == DividerType.solid ? dividerColor : null,
      child: type == DividerType.solid
          ? null
          : CustomPaint(
              size: Size(double.infinity, thickness),
              painter: _DashedDividerPainter(
                color: dividerColor,
                thickness: thickness,
                type: type,
                axis: Axis.horizontal,
              ),
            ),
    );
  }

  BorderStyle _mapType() {
    // ✅ ลบ default: ออก เพราะ Enum มีแค่ 3 ค่า และเราดักไว้ครบแล้ว
    switch (type) {
      case DividerType.dashed:
      case DividerType.dotted:
        return BorderStyle.none; // ใช้ CustomPainter แทน
      case DividerType.solid:
        return BorderStyle.solid;
    }
  }
}

class _DashedDividerPainter extends CustomPainter {
  final Color color;
  final double thickness;
  final DividerType type;
  final Axis axis;

  _DashedDividerPainter({
    required this.color,
    required this.thickness,
    required this.type,
    this.axis = Axis.horizontal,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final dashWidth = type == DividerType.dashed ? 8.0 : 2.0;
    final dashSpace = dashWidth;

    if (axis == Axis.horizontal) {
      double startX = 0;
      while (startX < size.width) {
        canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
        startX += dashWidth + dashSpace;
      }
    } else {
      double startY = 0;
      while (startY < size.height) {
        canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
        startY += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}