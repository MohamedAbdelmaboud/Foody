import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/core/constants/assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageDecoration buildPageDecoration() {
  return PageDecoration(
    bodyAlignment: Alignment.center,
    bodyTextStyle: GoogleFonts.montserrat(
      color: const Color(0xff001640),
      fontSize: 16,
    ),
  );
}

List<PageViewModel> pages = [
  PageViewModel(
    decoration: buildPageDecoration(),
    titleWidget: SvgPicture.asset(
      Assets.assetsImagesHealthylifestyleBro,
      height: 300,
    ),
    body:
        "Indulge in a culinary journey with our food app. Explore a world of delicious flavors right at your fingertips and transform your dining experience.",
  ),
  PageViewModel(
    titleWidget: SvgPicture.asset(
      Assets.assetsImagesOrderfoodAmico,
      height: 300,
    ),
    decoration: buildPageDecoration(),
    body:
        "Satisfy your cravings with ease. Discover a diverse range of cuisines and effortlessly order your favorite dishes for a delightful dining experience.",
  ),
  PageViewModel(
    decoration: buildPageDecoration(),
    titleWidget: SvgPicture.asset(
      Assets.assetsImagesOrderfoodPana,
      height: 300,
    ),
    body:
        "Treat yourself to culinary excellence. Our food app brings you handpicked dishes crafted with passion and quality, ensuring a taste that lingers.",
  ),
];
