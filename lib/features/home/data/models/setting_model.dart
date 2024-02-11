import 'package:flutter/material.dart';

class SettingsModel {
  final Color bgColor;
  final Color color;
  final String title;
  final String? value;
  final IconData iconData;
  final bool isDarkMode;

  SettingsModel({
    required this.bgColor,
    required this.color,
    required this.title,
    this.value,
    required this.iconData,
    this.isDarkMode = false,
  });
}

List<SettingsModel> settingsList = [
  SettingsModel(
    bgColor: Colors.orange.shade100,
    color: Colors.orange,
    title: 'Language',
    iconData: Icons.public,
    value: 'English',
  ),
  SettingsModel(
    bgColor: Colors.blue.shade100,
    color: Colors.blue,
    title: 'Notifications',
    iconData: Icons.notifications_none_rounded,
  ),
  SettingsModel(
    bgColor: Colors.purple.shade100,
    color: Colors.purple,
    title: 'Dark Mode',
    iconData: Icons.dark_mode_outlined,
    isDarkMode: true,
  ),
  SettingsModel(
    bgColor: Colors.red.shade100,
    color: Colors.red,
    title: 'Help',
    iconData: Icons.support,
  ),
];
