import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/core/widgets/food_shimmer.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';
import 'package:foody/features/layout/home/presentaion/views/details_view.dart';
import 'package:foody/features/layout/home/presentaion/views/widgets/favourite_Button.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
    this.isFavourite = false,
    required this.foodModel,
    required this.incredients,
    required this.time,
  });
  final FoodModel foodModel;
  final bool isFavourite;
  final int incredients;
  final int time;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.id, arguments: foodModel);
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              placeholder: (context, url) {
                return const ShimmerSkeleton(
                  width: 200,
                  height: 250,
                );
              },
              imageUrl: foodModel.image,
              fit: BoxFit.cover,
              height: 250,
              width: 200,
            ),
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
                    const Color(0xffffffff).withOpacity(.0),
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
                      foodModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle12.copyWith(
                          height: 1,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '$incredients incredients | $time min',
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
            child: FavouriteButton(
              foodModel: foodModel,
            ),
          )
        ],
      ),
    );
  }
}
