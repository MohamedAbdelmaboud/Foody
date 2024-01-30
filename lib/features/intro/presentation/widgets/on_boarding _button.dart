import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 35,
      decoration: BoxDecoration(
          color: MyColors.primaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
