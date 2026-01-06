import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';

class CheckoutStep {
  final int id;
  final String label;

  const CheckoutStep({required this.id, required this.label});
}

class CheckoutStepper extends StatelessWidget {
  final List<CheckoutStep> steps;
  final int currentStep;

  const CheckoutStepper({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ ดึง Tokens จาก Provider
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      margin: EdgeInsets.symmetric(vertical: tokens.spaceMedium), // spaceMedium (24.0)
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(steps.length, (index) {
          final step = steps[index];
          final bool isActive = currentStep == step.id;
          final bool isCompleted = currentStep > step.id;
          final bool isLast = index == steps.length - 1;

          return Expanded(
            flex: isLast ? 0 : 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCircle(
                      tokens: tokens,
                      isActive: isActive,
                      isCompleted: isCompleted,
                      stepId: step.id,
                    ),
                    SizedBox(height: tokens.spaceSmall), // spaceSmall (8.0)
                    Text(
                      step.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: tokens.fontWeightMedium,
                        color: (isActive || isCompleted)
                            ? tokens.colorPrimaryDefault
                            : tokens.colorTextTertiary,
                      ),
                    ),
                  ],
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      height: 2,
                      // กึ่งกลางวงกลม (32/2) = 16.0
                      margin: EdgeInsets.only(top: tokens.spaceDefault), 
                      color: isCompleted 
                          ? tokens.colorPrimaryDefault 
                          : tokens.colorBorderDefault,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCircle({
    required dynamic tokens, // รับ tokens มาใช้
    required bool isActive,
    required bool isCompleted,
    required int stepId,
  }) {
    return AnimatedContainer(
      duration: tokens.durationMedium, // durationMedium (300ms)
      curve: tokens.easingDefault,    // easingDefault
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? tokens.colorPrimaryDefault
            : (isCompleted ? tokens.colorSurfacePrimary : Colors.transparent),
        border: Border.all(
          color: (isActive || isCompleted) 
              ? tokens.colorPrimaryDefault 
              : tokens.colorBorderDefault,
          width: 2,
        ),
      ),
      child: Center(
        child: isCompleted
            ? Icon(
                Icons.check, 
                size: 18, 
                color: tokens.colorPrimaryDefault
              )
            : Text(
                '$stepId',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: tokens.fontWeightBold,
                  color: isActive ? tokens.colorTextInverse : tokens.colorTextTertiary,
                ),
              ),
      ),
    );
  }
}