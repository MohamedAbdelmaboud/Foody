import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/assets.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.assetsImagesFoody,
            height: 120,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Foody App',
            style: GoogleFonts.pacifico(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Savor the Flavors',
                  speed: const Duration(milliseconds: 140),
                  textStyle: const TextStyle(fontSize: 20)),
            ],
            isRepeatingAnimation: true,
          ),
        ],
      ),
    );
  }
}
