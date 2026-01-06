import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import '../component_preview.dart';

// ✅ Import ชื่อคลาสที่ถูกต้องตามไฟล์คอมโพเนนต์
import 'package:lookmix_design_system/src/components/typography/heading.dart';
import 'package:lookmix_design_system/src/components/typography/label.dart';
import 'package:lookmix_design_system/src/components/typography/paragraph.dart';

class TypographyStories extends StatelessWidget {
  const TypographyStories({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;

    return ListView(
      padding: EdgeInsets.all(tokens.spaceMedium),
      children: [
        // --- 1. Headings ---
        ComponentPreview(
          name: "Headings (Dynamic Scale)",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Heading("Heading Level 1", level: HeadingLevel.h1),
              SizedBox(height: 8),
              Heading("Heading Level 2", level: HeadingLevel.h2),
              SizedBox(height: 8),
              Heading("Heading Level 3", level: HeadingLevel.h3),
              SizedBox(height: 8),
              Heading("Heading Level 4", level: HeadingLevel.h4),
            ],
          ),
        ),

        // --- 2. Paragraphs ---
        ComponentPreview(
          name: "Paragraphs",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Paragraph(
                "This is a standard paragraph used for body text. It uses the base line height of 1.5 for better readability in long-form content.",
              ),
              const SizedBox(height: 16),
              const Paragraph(
                "This paragraph is secondary, using a lighter color for meta-data or descriptions.",
                isSecondary: true,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                color: tokens.colorTextPrimary, // พื้นหลังเข้ม
                child: const Paragraph(
                  "Inverse paragraph for dark backgrounds.",
                  inverse: true,
                ),
              ),
            ],
          ),
        ),

        // --- 3. Labels ---
        ComponentPreview(
          name: "Labels & Form Indicators",
          child: Wrap(
            spacing: 24,
            runSpacing: 16,
            children: const [
              Label("Default Label"),
              Label("Required Field", required: true),
            ],
          ),
        ),

        // --- 4. Typography Scale Matrix ---
        _buildTypographyScale(tokens),
      ],
    );
  }

  Widget _buildTypographyScale(dynamic tokens) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: tokens.colorSurfaceSecondary,
        borderRadius: BorderRadius.circular(tokens.radiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TYPOGRAPHY SCALE MATRIX (Base: ${tokens.fontSizeCaptionMedium}px)",
            style: TextStyle(
              fontWeight: tokens.fontWeightBold,
              fontSize: 12,
              color: tokens.colorTextTertiary,
            ),
          ),
          const Divider(),
          _scaleRow("Label/Caption", "${tokens.fontSizeCaptionMedium}", tokens.fontSizeCaptionMedium),
          _scaleRow("Paragraph", "${tokens.fontSizeCaptionMedium + 2.0}", tokens.fontSizeCaptionMedium + 2.0),
          _scaleRow("H3 (Level 3)", "${tokens.fontSizeCaptionMedium * 2.0}", tokens.fontSizeCaptionMedium * 2.0),
          _scaleRow("H2 (Level 2)", "${tokens.fontSizeCaptionMedium * 2.5}", tokens.fontSizeCaptionMedium * 2.5),
          _scaleRow("H1 (Level 1)", "${tokens.fontSizeCaptionMedium * 3.0}", tokens.fontSizeCaptionMedium * 3.0),
        ],
      ),
    );
  }

  Widget _scaleRow(String label, String value, double size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ),
          Expanded(
            flex: 5,
            child: Text("Lookmix Design System", style: TextStyle(fontSize: size, height: 1.2)),
          ),
          Expanded(
            flex: 1,
            child: Text("${value}px", style: const TextStyle(fontSize: 11, color: Colors.blueGrey), textAlign: TextAlign.right),
          ),
        ],
      ),
    );
  }
}