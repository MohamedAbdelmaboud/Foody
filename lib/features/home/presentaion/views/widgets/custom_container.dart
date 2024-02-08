import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: colors,
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Top Recepie 👋',
                  style: Styles.textStyle20
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  width: 230,
                  child: Text(
                    'spaghetti with meatballs',
                    style: Styles.textStyle16
                        .copyWith(color: Colors.white),
                  ),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                const Text(
                  '120 Reviews',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Image.asset(
              'assets/images/image.png',
              height: 100,
            ),
          ],
        ));
  }
}
