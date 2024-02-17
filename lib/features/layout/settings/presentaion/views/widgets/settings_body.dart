import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/Auth/presentaion/view_models/cubit/auth_cubit.dart';
import 'package:foody/features/Auth/presentaion/views/login_view.dart';
import 'package:foody/features/layout/settings/data/models/setting_model.dart';
import 'package:foody/features/layout/settings/presentaion/views/widgets/account_item.dart';
import 'package:foody/features/layout/settings/presentaion/views/widgets/settings_item.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      SettingsModel(
        bgColor: Colors.deepPurple.shade100,
        color: Colors.deepPurple,
        title: 'Log out',
        iconData: Icons.logout,
        onTap: () {
          BlocProvider.of<AuthCubit>(context).signOut();
          Navigator.popAndPushNamed(context, LoginView.id);
        },
      ),
    ];

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
