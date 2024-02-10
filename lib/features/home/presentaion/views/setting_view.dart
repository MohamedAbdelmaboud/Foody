import 'package:flutter/material.dart';
import 'package:foody/core/utlis/helpers.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/home/presentaion/views/widgets/account_item.dart';
import 'package:foody/features/home/presentaion/views/widgets/settings_item.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              navigateToHome(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
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
              child: ListView(
                scrollDirection: Axis.vertical,
                children: settingsList,
              ),
            )
          ],
        ),
      ),
    );
  }
}
