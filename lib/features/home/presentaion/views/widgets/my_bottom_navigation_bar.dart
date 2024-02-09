import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar(
      {super.key, required this.bottomNavIndex, required this.onTap});
  final int bottomNavIndex;
  final dynamic Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.home_rounded,
        Icons.favorite_sharp,
        Icons.shopping_cart_rounded,
        Icons.person_2_sharp,
      ],
      inactiveColor: Colors.white,
      backgroundColor: MyColors.primaryColor,
      activeIndex: bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      elevation: 10,
      leftCornerRadius: 20,
      rightCornerRadius: 20,
      onTap: onTap,
    );
  }
}
