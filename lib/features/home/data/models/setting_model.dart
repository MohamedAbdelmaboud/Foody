import 'package:flutter/material.dart';

class SettingsModel {
  final Color bgColor;
  final Color color;
  final String title;
  final String? value;
  final IconData iconData;
  final bool isDarkMode;
  final void Function()? onTap;
  SettingsModel({
    this.onTap,
    required this.bgColor,
    required this.color,
    required this.title,
    this.value,
    required this.iconData,
    this.isDarkMode = false,
  });
}
