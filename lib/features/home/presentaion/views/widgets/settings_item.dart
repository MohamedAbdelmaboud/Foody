import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/home/presentaion/views/widgets/forward_button.dart';

class SettingsItem extends StatefulWidget {
  final Color bgColor;

  final Color color;

  final String title;

  final String? value;
  final IconData iconData;
  final bool isDarkMode;
  const SettingsItem({
    super.key,
    required this.bgColor,
    required this.color,
    required this.title,
    this.value,
    required this.iconData,
    this.isDarkMode = false,
  });

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: widget.bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.iconData,
              color: widget.color,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            widget.title,
            style: Styles.textStyle14
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 2,
          ),
          Text(
            widget.value ?? '',
            style: Styles.textStyle12.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          widget.isDarkMode
              ? CupertinoSwitch(
                  activeColor: MyColors.primaryColor,
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                )
              : const ForwardButton()
        ],
      ),
    );
  }
}

List<SettingsItem> settingsList = [
  SettingsItem(
    bgColor: Colors.orange.shade100,
    color: Colors.orange,
    title: 'Language',
    iconData: Icons.public,
    value: 'English',
  ),
  SettingsItem(
    bgColor: Colors.blue.shade100,
    color: Colors.blue,
    title: 'Notifactions',
    iconData: Icons.notifications_none_rounded,
  ),
  SettingsItem(
    bgColor: Colors.purple.shade100,
    color: Colors.purple,
    title: 'Dark Mode',
    iconData: Icons.dark_mode_outlined,
    isDarkMode: true,
  ),
  SettingsItem(
    bgColor: Colors.red.shade100,
    color: Colors.red,
    title: 'Help',
    iconData: Icons.support,
  ),
];
