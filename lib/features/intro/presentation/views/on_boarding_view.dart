import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/features/Auth/presentaion/views/login_view.dart';
import 'package:foody/features/intro/presentation/widgets/page_view_models.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);
  static String id = '/OnboardingView';
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      animationDuration: 150,
      showDoneButton: true,
      showSkipButton: false,
      showNextButton: true,
      dotsDecorator: const DotsDecorator(
          spacing: EdgeInsets.all(8),
          activeSize: Size.square(15.0),
          activeColor: MyColors.primaryColor,
          size: Size.square(12),
          color: Color(0xffB2CCFF)),
      next: const Text(
        "Next",
        style: TextStyle(fontSize: 20),
      ),
      done: const Text(
       'Done',
        style: TextStyle(fontSize: 20),
      ),
      onDone: () => Navigator.pushReplacementNamed(context, LoginView.id),
    );
  }
}
