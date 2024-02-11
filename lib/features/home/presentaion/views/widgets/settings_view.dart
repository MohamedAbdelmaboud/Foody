import 'package:flutter/material.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/home/data/models/setting_model.dart';
import 'package:foody/features/home/presentaion/views/widgets/account_item.dart';
import 'package:foody/features/home/presentaion/views/widgets/settings_item.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Account',
            style: Styles.textStyle16
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          const AccountItem(),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Settings',
            style: Styles.textStyle16
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: settingsList.length,
              itemBuilder: (context, index) =>
                  SettingsItem(settingsModel: settingsList[index]),
            ),
          )
        ],
      ),
    );
  }
}
