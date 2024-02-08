import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody/core/constants/assets.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/core/widgets/custom_button.dart';
import 'package:foody/features/Auth/presentaion/views/sign_up_view.dart';
import 'package:foody/features/Auth/presentaion/widgets/custom_column.dart';
import 'package:foody/features/Auth/presentaion/widgets/custom_text_form_field.dart';
import 'package:foody/features/home/presentaion/views/home_view.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: key,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.login,
                  height: 200,
                ),
                Text(
                  'Login to continue',
                  style:
                      Styles.textStyle20.copyWith(color: MyColors.primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomColumn(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  prefixIcon: Icons.email_outlined,
                  text: 'Email',
                  hintText: 'Enter your Email',
                ),
                const Row(
                  children: [
                    Text(
                      'Password',
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
                CustomTextFromField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  prefixIcon: Icons.lock_outline,
                  hintText: 'Enter your password',
                  suffixIcon: Icons.visibility,
                ),
                TextButton(
                  onPressed: () {
                    /*
                try to make it as a Pro
                */
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forget password?',
                          style: Styles.textStyle14.copyWith(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, HomeView.id);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  isLoading: false,
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      svgPic(Assets.assetsImagesIcons8Google),
                      svgPic(Assets.assetsImagesIcons8Twitterx),
                      svgPic(Assets.assetsImagesIcons8Facebook),
                      svgPic(Assets.assetsImagesIcons8Github)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: Styles.textStyle14,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpView.id);
                      },
                      child: Text(
                        'sign up',
                        style: Styles.textStyle14.copyWith(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget svgPic(String path) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: SvgPicture.asset(
      path,
      height: 35,
    ),
  );
}
