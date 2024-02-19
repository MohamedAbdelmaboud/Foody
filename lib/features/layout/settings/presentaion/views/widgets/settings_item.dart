import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/themes/styles.dart';
import 'package:foody/features/layout/settings/data/models/setting_model.dart';
import 'package:foody/features/layout/settings/presentaion/views/widgets/small_button.dart';

class SettingsItem extends StatefulWidget {
  final SettingsModel settingsModel;
  const SettingsItem({Key? key, required this.settingsModel}) : super(key: key);

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
              color: widget.settingsModel.bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.settingsModel.iconData,
              color: widget.settingsModel.color,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            widget.settingsModel.title,
            style: Styles.textStyle14.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Text(
            widget.settingsModel.value ?? '',
            style: Styles.textStyle12.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          widget.settingsModel.isDarkMode
              ? CupertinoSwitch(
                  activeColor: MyColors.primaryColor,
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                )
              : SmallButton(
                  onTap: widget.settingsModel.onTap,
                  iconData: Icons.arrow_forward_ios_sharp,
                )
        ],
      ),
    );
  }
}
