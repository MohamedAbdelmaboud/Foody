import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody/core/constants/assets.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/core/widgets/custom_button.dart';
import 'package:foody/features/Auth/presentaion/widgets/custom_column.dart';
import 'package:foody/features/Auth/presentaion/widgets/custom_text_form_field.dart';
import 'package:foody/features/home/presentaion/views/home_view.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String password;
  late String confrimPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.assetsImagesEmailsamico,
                  height: 200,
                ),
                Text(
                  'Create an account',
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
                  text: 'User name',
                  hintText: 'Enter your name',
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
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const Row(
                  children: [
                    Text(
                      'Confirm Password',
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
                CustomTextFromField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else if (value != password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  prefixIcon: Icons.lock_outline,
                  hintText: 'Confirm your password',
                  suffixIcon: Icons.visibility,
                  onChanged: (value) {
                    confrimPassword = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: CustomButton(
                    text: 'Sign up',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, HomeView.id);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    isLoading: false,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: Styles.textStyle14,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Log in',
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
