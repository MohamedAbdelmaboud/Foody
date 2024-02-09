import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/features/home/presentaion/views/cart_view.dart';
import 'package:foody/features/home/presentaion/views/favourite_view.dart';
import 'package:foody/features/home/presentaion/views/widgets/home_body.dart';

import 'widgets/my_bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String id = '/HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController controller = PageController(initialPage: 0);
  var bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          controller.jumpToPage(0);
        },
        shape: const CircleBorder(),
        backgroundColor: MyColors.primaryColor,
        child: const Icon(
          Icons.food_bank_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomNavigationBar(
        bottomNavIndex: bottomNavIndex,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
            controller.animateToPage(
              bottomNavIndex,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        // physics: const BouncingScrollPhysics(),
        children: _list,
        onPageChanged: (index) {
          setState(() {
            bottomNavIndex = index;
          });
        },
      ),
    );
  }
}

List<Widget> _list = <Widget>[
  const HomeBody(),
  const FavouriteView(),
  const CartView(),
  const Center(
    child: Text(
      "Page 3",
    ),
  ),
];
