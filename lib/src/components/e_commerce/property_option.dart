import 'package:flutter/material.dart';

class PropertyOption {
  final String label;
  final String value;
  final bool disabled;
  final Color? color;

  PropertyOption({
    required this.label,
    required this.value,
    this.disabled = false,
    this.color,
  });
}