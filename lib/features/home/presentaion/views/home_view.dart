import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/features/home/presentaion/views/widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String id = '/HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _bottomNavIndex = 0;
  PageController controller = PageController(initialPage: 0);

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
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.home_rounded,
          Icons.favorite_sharp,
          Icons.shopping_cart_rounded,
          Icons.person_2_sharp,
        ],
        inactiveColor: Colors.white,
        backgroundColor: MyColors.primaryColor,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        elevation: 10,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            controller.animateToPage(
              _bottomNavIndex,
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
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}

List<Widget> _list = <Widget>[
  const HomeBody(),
  const Center(
    child: Pages(
      text: "Page 1",
    ),
  ),
  const Center(
    child: Pages(
      text: "Cart",
    ),
  ),
  const Center(
    child: Pages(
      text: "Page 3",
    ),
  ),
];

class Pages extends StatelessWidget {
  final String text;

  const Pages({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
