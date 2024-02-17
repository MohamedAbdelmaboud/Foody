import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/utlis/random.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/core/widgets/food_shimmer.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';
import 'package:foody/features/layout/home/presentaion/views/widgets/row_item.dart';


class FoodStack extends StatelessWidget {
  const FoodStack({
    super.key,
    required this.foodModel,
  });
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: CachedNetworkImage(
            placeholder: (context, url) {
              return ShimmerSkeleton(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
              );
            },
            imageUrl: foodModel.image,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  foodModel.title,
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const RowItem(
                        icon: Icons.group,
                        text: 'serves'), // Replace with your icon and text
                    RowItem(
                        icon: Icons.trending_up, text: foodModel.difficulty),
                    RowItem(
                        icon: Icons.timer_outlined,
                        text: '${generateRandomTime()}'),
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
