import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../theme/jpjoy_theme_provider.dart';

enum SkeletonVariant { text, circular, rectangular }

class JpjoySkeleton extends StatelessWidget {
  final SkeletonVariant variant;
  final double? width;
  final double? height;
  final String animation; // 'pulse' หรือ 'wave'

  const JpjoySkeleton({
    super.key,
    this.variant = SkeletonVariant.rectangular,
    this.width,
    this.height,
    this.animation = 'wave',
  });

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    final theme = JpjoyThemeProvider.of(context);

    return Shimmer.fromColors(
      baseColor: theme.isDark ? Colors.white10 : Colors.grey[300]!,
      highlightColor: theme.isDark ? Colors.white24 : Colors.grey[100]!,
      period: Duration(milliseconds: animation == 'pulse' ? 1500 : 800),
      child: Container(
        width: width,
        height: height ?? (variant == SkeletonVariant.text ? 16 : null),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: variant == SkeletonVariant.circular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: variant == SkeletonVariant.circular 
            ? null 
            : BorderRadius.circular(variant == SkeletonVariant.text ? 4 : 8),
        ),
      ),
    );
  }
}