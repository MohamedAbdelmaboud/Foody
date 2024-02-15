import 'package:flutter/material.dart';
import 'package:foody/core/utlis/helpers.dart';

import 'widgets/settings_view.dart';

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
      body: const SettingBody(),
    );
  }
}
