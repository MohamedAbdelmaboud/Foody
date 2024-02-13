import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/home/presentaion/views/cart_view.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: Text(
            'What are you cooking today?',
            style: Styles.textStyle20
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CartView.id);
          },
          child: const badges.Badge(
            badgeContent: Text(
              '2',
              style: TextStyle(color: Colors.white),
            ),
            showBadge: true, // show if the num bigger than 0
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.red, // 5 --> red & less--> blue
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
