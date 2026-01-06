import 'package:flutter/material.dart';

class TabBarItem {
  final String label;
  final String value;
  final Widget? icon;
  final String? href;

  TabBarItem({
    required this.label,
    required this.value,
    this.icon,
    this.href,
  });
}