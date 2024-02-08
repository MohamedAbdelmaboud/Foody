import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';

import 'widgets/custom_container.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/serach_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String id = '/HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _bottomNavIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffddddde),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: MyColors.primaryColor,
        child: const Icon(
          Icons.home,
          color: Colors.white,
        ),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.reviews,
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
          setState(() => _bottomNavIndex = index);
          print(index);
        },
        //cubit here for index
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: Column(
                  children: [
                    HomeAppBar(),
                    SizedBox(
                      height: 10,
                    ),
                    SerachField(),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: -80,
              child: CustomContainer(),
            ),
          ],
        ),
        const SizedBox(
          height: 90,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: Styles.textStyle20.copyWith(color: Colors.black),
                  ),
                  Text(
                    'See All',
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SizedBox(
                  height: 35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return const CategoryItem();
                    },
                  ),
                ),
              ),
              Text(
                'Trending Recipes',
                style: Styles.textStyle20.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const FoodItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.9),
      ),
      height: 35,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/image.png',
            height: 30,
          ),
          Text(
            'Main',
            style: Styles.textStyle14.copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
              fit: BoxFit.cover,
              height: 250,
              width: 200,
              'https://apipics.s3.amazonaws.com/vegan_api/16.jpg'),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: 250,
          width: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xffffffff),
                  const Color(0xffffffff).withOpacity(.1),
                  const Color(0xffffffff).withOpacity(.0),
                ]),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          bottom: 2,
          left: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    'Easy rhubarb cordial',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle12.copyWith(
                      
                      height:1,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '9 incredients | 35 min',
                  style: Styles.textStyle12.copyWith(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
            child: const Icon(Icons.favorite_outline_sharp,
                size: 20, color: Colors.black),
          ),
        )
      ],
    );
  }
}
