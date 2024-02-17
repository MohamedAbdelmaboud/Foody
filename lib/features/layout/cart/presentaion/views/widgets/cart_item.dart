import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/core/widgets/food_shimmer.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.foodModel,
  });
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            placeholder: (context, url) {
              return const ShimmerSkeleton(
                height: 120,
                width: 90,
              );
            },
            imageUrl: foodModel.image,
            fit: BoxFit.fitWidth,
            height: 120,
            width: 90,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  foodModel.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Styles.textStyle14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Main',
                style: Styles.textStyle12.copyWith(
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                r'$' '${120.0}',
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Color(0xFFFE4A49),
                  size: 30,
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xfff5f4f5),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 14,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 14,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
