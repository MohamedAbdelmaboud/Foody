import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.bottomNavIndex,
    required this.onTap,
  }) : super(key: key);

  final int bottomNavIndex;
  final dynamic Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: bottomNavIndex,
      height: 60,
      items: const <Widget>[
        Icon(Icons.home_rounded,color: Colors.white, size: 25),
        Icon(Icons.favorite_sharp,color: Colors.white, size: 25),
        Icon(Icons.shopping_cart_rounded,color: Colors.white, size: 25),
        Icon(Icons.person_2_sharp,color: Colors.white, size: 25),
      ],
      color: MyColors.primaryColor,
      buttonBackgroundColor: MyColors.primaryColor,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInCirc,
      animationDuration: const Duration(milliseconds: 330),
      onTap: onTap,
    );
  }
}
