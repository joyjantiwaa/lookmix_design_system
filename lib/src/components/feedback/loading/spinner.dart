import 'package:flutter/material.dart';
import '../../../../tokens/tokens.dart';
import '../../../theme/jpjoy_theme_provider.dart';

class JpjoySpinner extends StatelessWidget {
  final dynamic size; // รับเป็น String 'sm', 'md', 'lg' หรือ double
  final Color? color;

  const JpjoySpinner({super.key, this.size = 'md', this.color});

  double _getSize(double defaultSpace) {
    if (size is double) return size;
    switch (size) {
      case 'sm': return 16.0;
      case 'lg': return 40.0;
      case 'md':
      default: return 24.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    final double finalSize = _getSize(tokens.spaceMedium);

    return SizedBox(
      width: finalSize,
      height: finalSize,
      child: CircularProgressIndicator(
        strokeWidth: finalSize / 8,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? tokens.colorPrimaryDefault,
        ),
      ),
    );
  }
}