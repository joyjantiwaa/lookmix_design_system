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
    Key? key,
    this.orientation = DividerOrientation.horizontal,
    this.type = DividerType.solid,
    this.child,
    this.textAlign = DividerTextAlign.center,
    this.color,
    this.thickness = 1.0,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? Colors.grey[300];

    if (orientation == DividerOrientation.vertical) {
      return Container(
        width: thickness,
        height: 24,
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: dividerColor!,
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
                color: dividerColor!,
                width: thickness,
                style: _mapType(),
              ),
            ),
          ),
        ),
      );

      List<Widget> childrenList;
      switch (textAlign) {
        case DividerTextAlign.left:
          childrenList = [child!, SizedBox(width: 8), line];
          break;
        case DividerTextAlign.right:
          childrenList = [line, SizedBox(width: 8), child!];
          break;
        default:
          childrenList = [line, SizedBox(width: 8), child!, SizedBox(width: 8), line];
      }

      return Container(
        margin: margin ?? const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: childrenList,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                color: dividerColor!,
                thickness: thickness,
                type: type,
                axis: Axis.horizontal,
              ),
            ),
    );
  }

  BorderStyle _mapType() {
    switch (type) {
      case DividerType.dashed:
      case DividerType.dotted:
        return BorderStyle.none; // ใช้ CustomPainter
      case DividerType.solid:
      default:
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
