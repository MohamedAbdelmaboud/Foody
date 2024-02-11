import 'package:flutter/material.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/home/presentaion/views/widgets/row_item.dart';

class FoodStack extends StatelessWidget {
  const FoodStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: Image.network(
            'https://apipics.s3.amazonaws.com/vegan_api/16.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.40,
            width: double.infinity,
          ),
        ),
        Positioned(
          bottom: -33,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.bottomCenter,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xfff5f4f5).withOpacity(0.6),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Lemon basmati rice',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RowItem(
                        icon: Icons.group,
                        text: 'serves'), // Replace with your icon and text
                    RowItem(icon: Icons.trending_up, text: 'Easy'),
                    RowItem(icon: Icons.timer_outlined, text: '40 min'),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
