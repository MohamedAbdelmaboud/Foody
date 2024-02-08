import 'package:flutter/material.dart';
import 'package:foody/core/utlis/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff5f4f5),
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
