import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/src/components/feedback/modal.dart';
import 'package:lookmix_design_system/src/components/feedback/toast.dart';
import 'package:lookmix_design_system/src/components/feedback/loading/skeleton.dart';
import 'package:lookmix_design_system/src/components/feedback/loading/spinner.dart';
import 'package:lookmix_design_system/src/components/forms/button.dart'; 
import '../component_preview.dart';

class FeedbackStories extends StatelessWidget {
  const FeedbackStories({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return ListView(
      padding: EdgeInsets.all(tokens.spaceMedium),
      children: [
        // --- 1. Modal ---
        ComponentPreview(
          name: "Modal",
          child: Wrap(
            spacing: 8,
            children: [
              LookmixButton(
                label: "Open Default Modal",
                onClick: () { // เปลี่ยนเป็น onClick
                  LookmixModal.show(
                    context: context,
                    title: "Confirm Action",
                    // แก้จาก label เป็น Text
                    child: const Text("Are you sure you want to delete this item? This action cannot be undone."),
                    footer: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LookmixButton(
                          label: "Cancel",
                          appearance: ButtonAppearance.tertiary, // แก้เป็น appearance
                          onClick: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 8),
                        LookmixButton(
                          label: "Delete",
                          appearance: ButtonAppearance.danger, // แก้เป็น appearance
                          onClick: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
              LookmixButton(
                label: "Full Screen Modal",
                appearance: ButtonAppearance.outline, // แก้เป็น appearance
                onClick: () {
                  LookmixModal.show(
                    context: context,
                    title: "Edit Profile",
                    size: 'full',
                    child: const Center(child: Text("Profile Settings Form Content")),
                    footer: LookmixButton(
                      label: "Save Changes",
                      fullWidth: true,
                      onClick: () => Navigator.pop(context),
                    ),
                  );
                },
              ),
            ],
          ),
        ),

        // --- 2. Toast ---
        ComponentPreview(
          name: "Toast Notifications",
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              LookmixButton(
                label: "Success Toast",
                onClick: () => ToastService.show(context, "Data saved successfully!", type: ToastType.success),
              ),
              LookmixButton(
                label: "Error Toast",
                appearance: ButtonAppearance.danger,
                onClick: () => ToastService.show(context, "Failed to upload file.", type: ToastType.error),
              ),
              LookmixButton(
                label: "Info Toast",
                appearance: ButtonAppearance.secondary,
                onClick: () => ToastService.show(context, "You have 3 new messages."),
              ),
            ],
          ),
        ),

        // --- 3. Loading Spinner ---
        const ComponentPreview(
          name: "Spinner",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ // ลบ const หน้า Row ออก เพราะ Spinner อาจไม่ใช่ const
              JpjoySpinner(size: 'sm'),
              SizedBox(width: 24),
              JpjoySpinner(size: 'md'),
              SizedBox(width: 24),
              JpjoySpinner(size: 'lg'),
            ],
          ),
        ),

        // --- 4. Skeleton Loading ---
        ComponentPreview(
          name: "Skeleton",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const JpjoySkeleton(variant: SkeletonVariant.circular, width: 48, height: 48),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      JpjoySkeleton(variant: SkeletonVariant.text, width: 120),
                      SizedBox(height: 8),
                      JpjoySkeleton(variant: SkeletonVariant.text, width: 80),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const JpjoySkeleton(variant: SkeletonVariant.rectangular, height: 150, width: double.infinity),
            ],
          ),
        ),
      ],
    );
  }
}